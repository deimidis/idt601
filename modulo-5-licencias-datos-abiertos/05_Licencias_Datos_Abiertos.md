# Bloque 5 — Licencias de Datos y Datos Abiertos

**Módulo:** Ingeniería de Datos (IDT 601)
**Sesión:** 7 · **Carga:** 3 teóricas (Plan de Clases) · dictado en una sesión de 3 h

## ¿De qué trata este bloque?

Los bloques anteriores enseñaron **de dónde salen los datos**, **cómo se ingieren**, **cómo se
arquitectura** su almacenamiento y **cómo se integran y automatizan**. Todas esas son dimensiones
técnicas. Este bloque agrega la dimensión **legal y de gobernanza**: no alcanza con tener los datos;
hay que saber **bajo qué condiciones** se pueden usar, compartir y reutilizar.

El bloque responde tres preguntas: **¿qué es una licencia de datos?**, **¿qué es un dato abierto?** y
**¿qué dice Bolivia al respecto?**. Con ellas, cualquier persona puede decidir con criterio si un
conjunto de datos puede reutilizarse y qué se debe publicar y qué no.

## Lectura

### 1. Qué es una licencia de datos

Una **licencia** es un permiso formal que establece los derechos y las obligaciones de quien usa un
conjunto de datos. Su función central es **dar certeza**: al autor, qué protege; al usuario, qué puede
hacer sin arriesgarse. Un conjunto de datos **sin licencia** es jurídicamente ambiguo: nadie sabe si
puede copiarlo, mezclarlo o publicarlo.

La licencia es el **puente** entre "tener datos" y "usar datos ajenos con seguridad". En el sector
público, las licencias claras permiten que ciudadanía, empresas, periodistas y otras instituciones
construyan sobre los datos del Estado. Ejemplo: un municipio publica su ejecución presupuestaria en un
PDF **sin** nota de licencia; otra entidad no sabe si puede redistribuirla o armar un reporte con esos
datos.

### 2. El espectro: de cerrado a abierto

Las licencias se ordenan de **más cerrado** a **más abierto**:

| Nivel | Qué permite | Ejemplo |
|---|---|---|
| Todos los derechos reservados | Nada, salvo permiso expreso | Informe con "© todos los derechos reservados" |
| Licencias con condiciones | Usar bajo reglas (citar, no comercial) | CC BY-NC |
| Licencias abiertas | Usar, reutilizar y redistribuir | CC BY |
| Dominio público | Todo, sin condiciones | CC0 / ODC PDDL |

Si no se elige ninguna licencia, por defecto se cae en "todos los derechos reservados". Abrir un dato
es, entonces, una **decisión deliberada**, no un estado por defecto.

### 3. Las licencias abiertas: Creative Commons y Open Data Commons

**Creative Commons (CC)** nació para obras creativas y hoy se usa mucho en datos y documentos:

- **CC0** — renuncia total de derechos; equivale al dominio público. "Se puede hacer cualquier cosa,
  sin pedir permiso ni citar."
- **CC BY** — cualquier uso con la única condición de **atribuir**.
- **CC BY-SA** (compartir igual) y **CC BY-NC** (no comercial) agregan condiciones y dejan de ser
  plenamente abiertas en sentido estricto.

**Open Data Commons (ODC)** está pensado específicamente para **bases de datos**:

| Licencia | Condición | Equivalente CC |
|---|---|---|
| ODC PDDL | Dominio público, sin condiciones | CC0 |
| ODC-By | Atribución obligatoria | CC BY |
| ODbL | Atribución + compartir igual | CC BY-SA |

Para un conjunto de datos, ODC es técnicamente más adecuado que CC; para una obra creativa, CC.

### 4. La definición de "abierto" (y por qué gratis no es abierto)

Un dato es **abierto** si cualquiera puede **usarlo, reutilizarlo y redistribuirlo**. Las condiciones
aceptadas son, a lo sumo, **atribución** y **compartir igual**. Restricciones como "solo uso no
comercial" o "solo fines educativos" hacen que un dato **deje de ser abierto**.

El malentendido más común: **gratis ≠ abierto**. Un dato puede verse sin costo y, a la vez, estar
prohibido de redistribuir. "Abierto" es una condición jurídica precisa, no una sensación de
disponibilidad en la web.

### 5. Datos abiertos: principios y beneficios

El movimiento de **datos abiertos** parte de una idea simple: los datos producidos con **fondos
públicos** deben volver a la ciudadanía en formatos reutilizables. Sus principios:

1. **Abiertos por defecto** — publicar salvo razón fundada.
2. **Oportunos y completos** — actualizados y sin recortes arbitrarios.
3. **Accesibles y usables** — formatos legibles por máquina (CSV, JSON), no solo PDF o imágenes.
4. **Interoperables y comparables** — estándares comunes para cruzar datos entre instituciones.
5. **Para la mejora y la innovación** — orientados a la reutilización.

**Beneficios:** transparencia (la ciudadanía verifica el uso de recursos), reutilización (otros
construyen servicios), innovación (aplicaciones y emprendimientos) y control social (prensa y
organizaciones vigilan la gestión). En Bolivia, los portales de referencia son **`datos.gob.bo`** y
**`gob.bo`** (sección "Datos abiertos del Estado").

**Un dato abierto real:** la *Encuesta Final-Profesores de Inclusión Digital* de AGETIC
(datos.gob.bo, 2019) es un conjunto publicado bajo **CC-BY** que se usa como insumo del taller de la
sesión 7. Su caso combina todas las ideas del bloque: licencia, atribución, reutilización y datos
personales de los encuestados en un solo objeto.

> Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*, Datos Abiertos Bolivia
> (datos.gob.bo, 2019). Licencia CC-BY.

### 6. Límites: datos abiertos y datos personales

**Datos personales** son los que identifican o hacen identificable a una persona (nombre, DNI,
teléfono, domicilio, salud). La apertura **nunca** implica publicar datos personales: se aplican
**anonimización** (quitar o alterar identificadores) y **agregación** (agrupar y resumir).

La regla práctica es **abrir el dato agregado, proteger el dato individual**:

| Escenario | ¿Publicar? | Por qué |
|---|---|---|
| Cantidad de beneficiarios por municipio | Sí | Dato agregado; no identifica personas |
| Listado de beneficiarios con DNI y domicilio | No | Dato personal identificable |
| Presupuesto ejecutado por programa | Sí | Información pública de gestión |
| Historia clínica individual | No | Dato sensible; requiere protección |

### 7. El marco normativo boliviano

Se citan las normas por su número y objeto, sin inventar artículos:

- **Constitución Política del Estado (2009), art. 21.2** — reconoce los derechos a la intimidad,
  privacidad, honor y propia imagen.
- **Constitución Política del Estado (2009), art. 130–131** — **acción de protección de la
  privacidad** (antes hábeas data): permite acceder, rectificar y eliminar datos de registros públicos
  o privados. Es la **base constitucional de la protección de datos personales** en Bolivia.
- **Ley N.º 164 (2011)** — ley marco de telecomunicaciones y TIC; sienta las bases del gobierno
  electrónico.
- **D.S. 1793 (2013)** — reglamenta el gobierno electrónico; impulsa el **software libre** y los
  **estándares abiertos**.
- **D.S. 2514 (2015)** — crea la **AGETIC**, entidad rectora del gobierno electrónico.
- **D.S. 3251 (2017)** — aprueba los planes de gobierno electrónico y de software libre y estándares
  abiertos.
- **D.S. 5340 (2025)** — crea la plataforma **gob.bo**, administrada por AGETIC; uno de sus componentes
  es **"Datos abiertos del Estado"**.
- **D.S. 5468 (2025)** — actualiza el Plan de Implementación de Gobierno Electrónico (vigencia hasta
  2028) y mantiene el de Software Libre y Estándares Abiertos.
- **Lineamientos de Datos Abiertos de AGETIC** — guías técnicas para publicar con estándares,
  metadatos y licencias.
- **LPG-Bolivia** — Licencia Pública General de Bolivia, de **software libre** del Estado (aplica a
  software, no a datos).

**Sobre la protección de datos personales:** Bolivia **no cuenta todavía con una ley integral**. La
protección vigente es **constitucional** (art. 21.2 y 130–131) y hay proyectos en trámite (un proyecto
de ley de acceso a la información pública aprobado por el Senado en 2026 y remitido a Diputados, y un
anteproyecto de datos personales de AGETIC).

## Ideas clave

1. Una **licencia** es un permiso formal: sin licencia clara, los datos no se reutilizan con seguridad.
2. Los datos **abiertos** son los que cualquiera puede usar, reutilizar y redistribuir.
3. **Abierto no es "sin reglas"**: a lo sumo se exige atribución y compartir igual; y "gratis ≠ abierto".
4. **Datos abiertos ≠ datos personales**: abrir lo agregado, proteger lo individual.
5. Bolivia tiene **marco normativo** (CPE 130–131, Ley 164, D.S. 1793/2514/3251/5340/5468, lineamientos
   de AGETIC y LPG-Bolivia) y su protección de datos personales está **en desarrollo**.

## Glosario

| Término | Definición breve |
|---|---|
| Licencia de datos | Permiso formal sobre qué se puede hacer con un conjunto de datos. |
| Licencia abierta | Permite usar, reutilizar y redistribuir con pocas o ninguna condición. |
| Dominio público | Sin restricciones; el autor renuncia a los derechos. |
| CC0 / ODC PDDL | Renuncia total de derechos (dominio público). |
| CC BY / ODC-By | Cualquier uso con la condición de atribuir. |
| Atribución | Citar al autor o la fuente. |
| Compartir igual | Lo derivado conserva la misma licencia. |
| Dato abierto | Dato que cualquiera puede usar, reutilizar y redistribuir. |
| Datos personales | Los que identifican o hacen identificable a una persona. |
| Anonimización / agregación | Técnicas para publicar sin exponer individuos. |

## Para repasar (autoevaluación)

1. ¿Qué es una licencia de datos y por qué da certeza?
2. ¿Qué diferencia hay entre CC BY y CC BY-NC? ¿Cuál es abierta?
3. ¿Por qué "gratis" no es lo mismo que "abierto"?
4. ¿Qué base constitucional protege los datos personales en Bolivia?

## Referencias recomendadas

- Creative Commons: <https://creativecommons.org/licenses/>.
- Open Data Commons: <https://opendatacommons.org/licenses/>.
- Open Definition (Open Knowledge): <https://opendefinition.org/>.
- AGETIC / Datos Abiertos Bolivia: <https://www.gob.bo/>.

## Presentación del bloque

- `presentacion_sesion7.html` — presentación reveal del bloque.
- `deck-sesion-07.html` — deck del participante (funciona sin internet).
