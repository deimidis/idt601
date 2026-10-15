# Guía de solución del docente — Taller de la Sesión 5

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 3 — Arquitectura de Datos
**Uso:** respuestas modelo para el caso del taller (`taller_sesion5_diseno_arquitectura.md`). Acompaña la guía del
taller y la rúbrica de `REPASO_DOCENTE_BLOQUE3.md` §8.2.
**Respaldo y evidencia:** `.research/taller-sesion5-materiales/REPORT.md` (55 fuentes).

> **Advertencia pedagógica.** No existe **una** respuesta correcta: los cuatro criterios de elección
> (uso/caso · volumen · estructura del dato · tiempo real) admiten más de un patrón defendible. Esta guía
> distingue, en cada variante, la **respuesta esperada**, las **respuestas aceptables** y la **alternativa
> descartada**. Evalúa siempre la **coherencia** entre caso, fuentes, componentes y patrón, no la coincidencia
> literal con esta guía. Si entregas esta guía a los equipos durante el taller, pierde valor como autoevaluación
> (ver §9).

---

## 0. El caso, en una frase

Una gobernación registra reclamos en tres sistemas (ventanilla, teléfono, formulario web), anota las
inspecciones en papel y arma los indicadores a mano en Excel. Necesita **un reporte mensual confiable** de
reclamos atendidos y **una alerta inmediata** cuando un reclamo crítico se repite en la misma zona.

Las variantes solo cambian el **énfasis**: A reportes mensuales (datos limpios), B alerta inmediata (frescura),
C análisis histórico (guardar todo).

---

## 1. Caso y objetivo (respuesta esperada)

**Objetivo:** mejorar la atención al ciudadano tomando decisiones con datos confiables, unificando los canales
de reclamo y reemplazando los indicadores manuales.

**Preguntas que la arquitectura debe responder** (esto es lo que se califica):

| # | Pregunta | Sirve a |
|---|---|---|
| 1 | ¿Cuántos reclamos ingresaron, se atendieron y siguen abiertos en el mes, por tipo, canal y zona? | Variante A |
| 2 | ¿El número es **confiable** (sin duplicados entre los tres sistemas)? | Todas (calidad) |
| 3 | ¿Aumentaron anómalamente los reclamos **críticos repetidos** en una misma zona en los últimos días? | Variante B |
| 4 | ¿Cuánto tarda en resolverse un reclamo por tipo y por zona? | A y C |
| 5 | ¿Qué pasó históricamente con cada tipo de reclamo / zona? | Variante C |

**Dos niveles de servicio distintos (idea clave):** el reporte tolera horas o días; la alerta exige minutos. Ese
contraste es el que justifica (o no) una capa de tiempo real.

**Errores a corregir aquí:** objetivo genérico ("mejorar la gestión") sin una pregunta respondible; y no separar
la latencia del reporte de la de la alerta.

---

## 2. Fuentes de datos y su tipo (respuesta esperada)

| Fuente | Tipo | Formato | Implicación de diseño |
|---|---|---|---|
| Sistema de ventanilla | **Estructurado** | Tablas de BBDD | Ya trae identificador (n.º de expediente). Se mapea al esquema canónico. |
| Sistema telefónico | **Estructurado** | Tablas de BBDD | Ídem; hay que mapear su estado al estado común. |
| Formulario web | **Semiestructurado** | JSON | Decisión explícita: conservar el objeto (columna tipo VARIANT) o aplanarlo en columnas. |
| Inspecciones en papel | **No estructurado** | Documentos escaneados | OCR → JSON estructurado + **revisión humana** cuando la confianza del OCR cae bajo un umbral. |
| Planilla de indicadores | **Estructurado** | Excel | Es justo el trabajo manual que la arquitectura debe reemplazar; fuente conocida de errores. |

**Y el paso que casi todos olvidan — fijar el esquema canónico del reclamo.** Antes de reportar hay que unificar
los tres canales en un solo modelo. Referencias reales: Open311 y el SUR de Montevideo.

| Campo canónico | Ejemplo | Respaldo |
|---|---|---|
| `id_reclamo` | consecutivo único | "fuentes únicas" y registro consecutivo (MinTIC) |
| `canal_origen` | ventanilla / teléfono / web | campo `source` de Open311 |
| `tipo → grupo → área` | bache → vialidad → obras | taxonomía jerárquica del SUR (Montevideo) |
| `zona` / barrio (geo) | barrio + coordenadas WGS84 | dirección jerárquica y geo de Open311 |
| `estado` | ingresado / en proceso / finalizado | estado del SUR / open-closed de Open311 |
| `fecha_ingreso` / `fecha_cierre` | marcas de tiempo | ciclo de vida del reclamo |
| `criticidad` | ordinario / crítico | regla de negocio (la define el dueño del dato) |

> **Pista para orientar:** señala que los tres canales registran el **mismo hecho** en tres lugares. Si no hay
> `id_reclamo` común, aparecen **duplicados** y ninguna cifra es confiable —ni para A ni para B—.

---

## 3. Componentes (respuesta esperada)

Los **cuatro componentes** del bloque, más las posiciones de fuente y uso. Recuerda: **catálogo y gobernanza son
capas transversales**, no una caja más del flujo.

| Componente | En este caso |
|---|---|
| **Almacenamiento** | *Operacional*: las tres bases de los sistemas + **repositorio de escaneos** (inspecciones). *De análisis*: warehouse / lakehouse / ambos, según la variante. |
| **Procesamiento** | Extracción y **OCR de las actas**, limpieza, unión de canales, **deduplicación por `id_reclamo`**, normalización al esquema canónico y cálculo de indicadores. Por lotes y/o micro-lote según la variante. |
| **Catálogo** | Diccionario de datos (definición, formato, dueño, origen de cada campo), **linaje** (de dónde salió cada número) y un glosario de "reclamo crítico". |
| **Gobernanza** | Roles, clasificación, control de acceso, dimensiones de calidad, seguridad y retención (§6). |
| *Fuente / Uso* | Posiciones, no componentes: los tres sistemas son fuente; el tablero, la alerta y la exploración son uso. |

**Errores a corregir aquí:** cajas que "guardan y limpian" a la vez (separa almacenamiento de procesamiento);
catálogo o gobernanza dibujados como una etapa más; y tratar igual el formulario web (JSON) que las actas en
papel (OCR).

---

## 4. Patrón elegido, por variante

### Variante A — reportes mensuales (datos limpios y confiables)

- **Patrón esperado: Data warehouse** (modelo en estrella).
- **Justificación con los cuatro criterios:** *uso* = reporte fijo y agregado; *volumen* = bajo a medio;
  *estructura* = datos ya depurados y estructurados tras el procesamiento; *tiempo real* = no se necesita.
- **Alternativa descartada:** *Data lake* — guarda crudo, pero sin esquema ni gobierno no garantiza cifras
  confiables y deriva en "pantano de datos". *Lambda* — sobreingeniería: no hace falta capa de velocidad.
- **Respuesta aceptable:** *data lakehouse* si el equipo quiere **conservar además** el crudo (justificándolo);
  o implementar el warehouse sobre el lakehouse. Lo que **no** es aceptable es un "Excel más grande" sin
  procesamiento ni gobierno.

### Variante B — alerta inmediata (frescura)

- **Patrón esperado: Lambda** (capa batch + capa de velocidad). El caso pide **las dos cosas** (reporte
  confiable **y** alerta inmediata), y lambda es el patrón del bloque que cubre ambos caminos.
- **Justificación con los cuatro criterios:** *uso* = reporte **y** alerta; *volumen* = bajo, pero con requisito
  de latencia; *estructura* = mixta (numérico + geo); *tiempo real* = **sí**.
- **Alternativa descartada:** *Data warehouse puro* — no puede alertar en el momento. *Data lake* — no resuelve
  la frescura por sí solo.
- **Matiz obligatorio (esto separa una respuesta "alta"):** lambda es el patrón **más caro de operar** porque
  obliga a mantener la misma lógica en dos sistemas. Si "inmediata" tolera **minutos**, un **micro-lote**
  (segundos a minutos) más un lote para el reporte resuelve con menos costo y complejidad. Respuesta aceptable:
  lambda **o** micro-lote con justificación explícita de la latencia tolerada.

### Variante C — análisis histórico (guardar todo)

- **Patrón esperado: Data lakehouse.**
- **Justificación con los cuatro criterios:** *uso* = explorar después, sin saber aún todas las preguntas;
  *volumen* = creciente; *estructura* = mixta, incluidos escaneos; *tiempo real* = no.
- **Alternativa descartada:** *Data warehouse solo* — descarta el detalle crudo y lo no estructurado, que es
  justo lo que la variante quiere conservar. *Data lake desnudo* — máximo detalle, pero sin catálogo ni
  gobierno se convierte en pantano de datos.
- **Respuesta aceptable:** *data lake* **con** gobierno explícito (bronce/plata/oro), o lakehouse. El énfasis
  no es la tecnología sino **guardar crudo sin perder la capacidad de encontrarlo y confiar en él**.

> **Regla de oro para la puesta en común:** no hay patrón mejor; hay patrón adecuado. Elegir lakehouse o lambda
> "porque suenan modernos" agrega costo sin beneficio. Y el lakehouse **no reemplazó** al warehouse ni al lake:
> son opciones vivas.

---

## 5. Diagrama de flujo (modelo)

**Estructura común a las tres variantes** (fuente → uso, cinco etapas):

```
Fuentes          →  Almacenamiento        →  Procesamiento          →  Almacenamiento de      →  Uso
                    operacional                                     análisis
──────────────────────────────────────────────────────────────────────────────────────────────────────
Ventanilla (BBDD)    Base operacional        Extracción + limpieza +   [según variante]          Reporte mensual
Teléfono (BBDD)      (registro del día)      unión + deduplicación                                Alerta (B)
Web (JSON)                                   (por lotes)
Inspecciones         Repositorio de          OCR → revisión humana
(papel)              escaneos                bajo umbral de confianza
──────────────────────────────────────────────────────────────────────────────────────────────────────
        [ CATÁLOGO ]  y  [ GOBERNANZA ]  atraviesan TODAS las etapas (capas transversales)
```

**A — warehouse:**
```
... → Procesamiento (lote nocturno) → DATA WAREHOUSE (hechos + dimensiones) → Reporte mensual (tablero)
```

**B — lambda (dos caminos):**
```
... ├─► CAPA BATCH   (historia completa, lote) ─► Warehouse ─► Reporte mensual
    └─► CAPA VELOCIDAD (micro-lote/streaming) ─► Regla de alerta ─► ALERTA inmediata
Regla de alerta: contar reclamos críticos por ZONA (+ vecinas) en ventana de 7 días sobre base de 30,
comparar contra el umbral definido y notificar al responsable.
```

**C — lakehouse (por capas):**
```
... → BRONCE (crudo: JSON, escaneos, CSV) → PLATA (validado, deduplicado, esquema aplicado)
    → ORO (agregados / modelo dimensional) → Reporte + Exploración histórica
```

**Qué evalúa la rúbrica del diagrama:** que un tercero lo entienda; que aparezcan las fuentes, el procesamiento
**separado** del almacenamiento, el almacenamiento de análisis, el uso, y **catálogo y gobernanza como bandas
transversales** (no como cajas de la fila).

---

## 6. Reglas de gobernanza (respuesta esperada)

**Roles (modelo dueño / cuidador / custodio):**

| Rol | Quién es en el caso | Qué responde |
|---|---|---|
| **Dueño del dato** | Secretaría/Dirección de Atención al Ciudadano | Significado y calidad; **qué es un "reclamo crítico"**; clasificación; calendario de retención; quién accede. |
| **Cuidador (steward)** | Analista/gestor de datos del área | Mantiene el catálogo, el diccionario y las reglas de calidad día a día. |
| **Custodio** | TI / Sistemas | Opera el almacenamiento, aplica seguridad y garantiza que **todo cambio sea auditable**. |

**Las cuatro preguntas de gobernanza, respondidas para el caso:**

| Regla | Qué se define |
|---|---|
| **Quién accede** | Clasificar los datos (p. ej. criticidad baja/media/alta). Los **datos personales** de cada reclamo solo los ve el personal autorizado; para análisis y publicación se usan datos **agregados o anonimizados**. Los indicadores públicos van agregados por zona/tipo. |
| **Calidad** | Definir dimensiones medibles y su campo: **exactitud** (la zona coincide con la dirección), **completitud** (no falta el tipo), **consistencia** (el mismo reclamo no cambia entre canales), **vigencia** (el estado está actualizado), **unicidad** (sin duplicados por `id_reclamo`), **validez** (formato correcto). |
| **Seguridad y privacidad** | Uso de los datos personales **solo para el fin previsto** (Ley 1080); medidas de **seudonimización y cifrado**; la privacidad se incorpora desde el diseño. |
| **Retención y trazabilidad** | Conservar **solo el tiempo necesario** para la finalidad; registrar el **linaje** ("¿de dónde salió este número?"); que los cambios sean auditables. |
| **Contrato de datos** | Acuerdo formal con los sistemas de origen y con entidades externas: esquema, reglas de calidad, accesos, plazos de respuesta. Convierte una dependencia informal en un compromiso verificable. |

**Reglas específicas de la alerta (variante B):** quién recibe la alerta, qué se considera crítico, la **ventana**
(7 días sobre base de 30 es un punto de partida defendible), la **zona** (unidad + vecinas contiguas) y el
**umbral**, calibrado por la tasa de falsas alarmas aceptable (menos umbral = más ruido). Este es un requisito
que casi todos los equipos olvidan: **la alerta también se gobierna**.

---

## 7. Puesta en común: preguntas y respuestas esperadas

| Pregunta del docente | Qué esperar |
|---|---|
| ¿Por qué ese patrón y no otro? | Las cuatro criterios explícitos + una alternativa descartada con motivo. |
| ¿Cómo garantizan la calidad del dato? | Esquema canónico + deduplicación por id + dimensiones de calidad + roles. |
| ¿Quién accede y con qué reglas? | Dueño/cuidador/custodio nombrados; acceso por clasificación; agregación para análisis. |
| ¿Dónde está el catálogo en su diagrama? | Como banda transversal, no como caja. |
| ¿Qué hacen con las actas en papel? | OCR + revisión humana bajo umbral; no se "tratan igual" que el JSON. |
| ¿Su alerta no va a llenar de falsas alarmas? | Umbral y ventana definidos; umbral calibrado por tasa de falsas alarmas. |
| ¿Qué pasa con los reclamos duplicados entre canales? | Identificador único y regla de deduplicación. |

---

## 8. Rúbrica del taller (5 criterios × 3 anclajes)

Idéntica a `REPASO_DOCENTE_BLOQUE3.md` §8.2. **Compártela al dar la consigna.** Los niveles intermedios
(60–69 y 85–94) se interpolan; la escala es la del Plan de Clases.

| Criterio | Logro inicial (1–59) | Logro suficiente (70–84) | Logro total (95–100) |
|---|---|---|---|
| **Caso y fuentes** | Objetivo genérico; fuentes sin tipo | Objetivo con una pregunta respondible; fuentes con tipo | Objetivo y pregunta precisos; fuentes completas con tipo y origen |
| **Componentes** | Faltan componentes o se confunden almacenamiento y procesamiento | Los cuatro componentes correctamente definidos | Los cuatro, con catálogo y gobernanza como capas transversales y ejemplos propios |
| **Patrón elegido** | Nombra un patrón sin justificar | Patrón adecuado con justificación | Justificado con los cuatro criterios **y una alternativa descartada con motivo** |
| **Diagrama y gobernanza** | El diagrama omite catálogo o gobernanza | Flujo completo de fuente a uso con capas transversales | Diagrama legible por un tercero + reglas de gobernanza con dueños y condiciones de acceso |
| **Coherencia interna** | Las secciones se contradicen | Caso, fuentes, componentes y patrón coherentes | Todo el diseño se sostiene y el grupo defiende cada decisión |

> **Nota sobre la rúbrica (respaldo):** mejora la confiabilidad si es analítica, específica y acompañada de
> ejemplos; por sí sola no garantiza validez, y sin criterio del evaluador no corrige el sesgo hacia lo
> superficial. Úsala como guía de expectativas y retroalimentación, no como medidor automático.

---

## 9. Bloqueos típicos y cómo orientar

| Bloqueo | Cómo se detecta | Cómo orientar |
|---|---|---|
| Confunden almacenamiento con procesamiento | "Guardamos y limpiamos" en la misma caja | Separa **dónde** se guarda de lo que **transforma**. |
| Eligen patrón sin justificarlo | El patrón no se conecta con el caso | Vuelve a los cuatro criterios: uso, volumen, estructura, tiempo real. |
| Olvidan catálogo y gobernanza | No aparecen en el diagrama | Son capas **transversales obligatorias**: dibújalas como bandas. |
| Ignoran el tipo de dato | Tratan igual el formulario web y las actas en papel | Retoma estructurado / semiestructurado / no estructurado (Bloque 1). |
| No unifican los tres canales | No hay `id_reclamo` común ni deduplicación | Hay tres registros del **mismo** hecho: sin llave común aparecen duplicados. |
| "Lambda porque suena moderno" | Eligen lambda sin necesidad de tiempo real | Pregunta la **latencia tolerada**. Si es de minutos, micro-lote basta. |
| La alerta no está gobernada | No dicen quién la recibe ni con qué umbral | Toda alerta necesita dueño, umbral, ventana y destinatario. |

> **Cautela didáctica:** mostrar la solución completa **no** siempre enseña ("reversión por pericia"): el
> andamiaje que ayuda al principiante se vuelve redundante para quien ya sabe. En la puesta en común, **contrasta**
> en vez de solo exhibir: pide al equipo que compare su diseño con otro y que explique la diferencia.

---

## Fuentes de respaldo (selección)

- **Casos y normas de gobierno:** Open311 GeoReport v2 y Bulk (`wiki.open311.org`); SUR de Montevideo (dataset
  abierto de la IM); MinTIC Colombia, Resolución 2893/2020 y *Guía de calidad e interoperabilidad de datos
  abiertos* (2025); PNUD / GAD Puyango, *Cómo va mi barrio* (2024); SIRAD — Municipalidad de Córdoba (2016);
  Ayuntamiento de Madrid, Cuadro de Mando de Administración Digital; Bogotá Te Escucha.
- **Patrones:** Kreps, *Questioning the Lambda Architecture* (2014); Armbrust et al., *Lakehouse* (CIDR 2021) y
  *Delta Lake* (PVLDB 2020); J. Lin, *The Lambda and the Kappa* (IEEE, 2017); Microsoft Fabric y AWS
  (arquitecturas de alerta en tiempo real); Databricks, *Medallion* y *Batch vs streaming*.
- **Gobernanza y calidad:** GOV.UK, *Data ownership model*; CEPAL (2023), gobernanza de datos en el sector
  público; UNE 0077/0078/0079:2023; ISO/IEC 25012 (2008); Bitol/ODCS (Linux Foundation); AGETIC, Ley 1080 y
  Manual de Protección de Datos; anteproyecto de ley de datos personales (Bolivia, 2024).
- **Detección de la alerta:** CDC/MMWR (CUSUM de Poisson, 2004); *prospective space–time permutation scan
  statistic* (2005); EARS / Farrington Flexible (2019).

Lista completa de las 55 fuentes con URL y fecha de consulta: `.research/taller-sesion5-materiales/REPORT.md`.
