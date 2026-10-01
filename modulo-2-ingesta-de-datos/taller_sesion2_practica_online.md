# Práctica — Sesión 2: conectar una fuente sencilla (modalidad en línea)

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 2 — Ingesta de Datos
**Duración:** 60 min de práctica (dentro de la sesión de 3 horas)
**Herramienta:** hoja de cálculo — **Google Sheets** (recomendado) o **Excel en línea**
**Fuente de datos:** `datos/encuesta_profesores_recorte.csv` (ver `datos/FUENTE.md`)

---

## Objetivo

Al terminar, cada participante habrá **conectado una fuente de datos real** (un CSV de datos abiertos)
a una hoja de cálculo y podrá **describir su estructura**: cuántas filas y columnas tiene, cómo se
llaman sus columnas y qué tipo de dato guardan.

No se busca limpiar ni transformar todavía: solo **extraer** y **ver** la fuente (los dos extremos que
vimos en la sesión).

## Reparto del tiempo (60 min, en línea)

| Momento | Tiempo | Quién |
|---|---|---|
| Instrucciones y reparto de la fuente por el chat | 5 min | Docente |
| **Modo A** — trabajo guiado en salas (o **Modo B** si se demuestra) | 40 min | Participantes / Docente |
| Puesta en común y registro de método y herramienta | 15 min | Todos |

> El docente elige **un** modo según el grupo. Con grupos con poca base técnica o conexiones
> inestables conviene el **Modo B** (demostración); con grupos más autónomos, el **Modo A**.

## Preparación previa (el día anterior)

1. Subir a Moodle: `datos/encuesta_profesores_recorte.csv` y `datos/diccionario_recorte.md`.
2. Pegar en el foro/chat el **enlace directo** al CSV oficial (opcional, para el modo "conectar en línea"):
   `https://datos.gob.bo/dataset/bf97cf5a-a8d3-4694-926c-2a3da3df40e5/resource/119afffe-8e0a-4657-9cea-40fd6837b90c/download/profesores_fin.csv`
3. Tener abierta una **hoja de demostración** ya importada, por si hay problemas de conexión.
4. Pedir a los participantes que **abran una cuenta de Google** o Excel en línea antes de la clase.

---

## Modo A — Trabajo de participantes (salas)

**Consigna:** "Conecten el archivo a su hoja de cálculo y respondan: ¿cuántas filas y columnas tiene?,
¿qué representan las columnas del `a0` al `h3`?".

### Paso a paso — Google Sheets

1. **Extraer la fuente.** `Archivo → Importar → Cargar` y seleccionar `encuesta_profesores_recorte.csv`.
2. En "Ubicación de importación" elegir **Reemplazar hoja de cálculo**; separador: **Coma**.
3. **Observar la estructura.** Confirmar que aparecen **17 columnas** (A–Q) y **871 filas de datos**
   (la última fila es la 872, contando el encabezado).
4. **Leer los encabezados.** Anotar que los nombres son **códigos** (`a0`, `a1`, `b2`…), no palabras.
5. **Cruzar con el diccionario.** Abrir `diccionario_recorte.md` y anotar a qué pregunta corresponde
   cada código.

### Paso a paso — Excel en línea

1. `Datos → Obtener datos → Desde archivo → Desde texto/CSV` y elegir el archivo.
2. Origen del archivo: **65001: Unicode (UTF-8)**; delimitador: **Coma**. Clic en **Cargar**.
3. Verificar las mismas cifras: 17 columnas y 871 filas de datos.

### Registro (para la puesta en común)

Cada participante/equipo anota y comparte en el chat:

- **Método:** batch (importación puntual).
- **Herramienta:** conector de importación de la hoja de cálculo.
- **Estructura detectada:** 871 filas × 17 columnas; encabezados codificados.
- **Una observación de calidad:** "hay columnas con `NA`/`N/A` y celdas vacías".

---

## Modo B — Demostración del docente (guion para compartir pantalla)

Versión **totalmente guiada**: el docente comparte pantalla y ejecuta el proceso en vivo, narrando cada
paso. Duración sugerida: **15–20 min**. Los participantes siguen con la vista y anotan.

1. **Encuadre (1 min).** "Vamos a conectar una fuente real de datos abiertos de Bolivia, sin instalar
   nada, con una hoja de cálculo. Miren el proceso completo."
2. **Abrir la hoja en blanco (1 min).** Compartir pantalla en Google Sheets. Nombrar la hoja "crudo".
3. **Extraer (4 min).** `Archivo → Importar → Cargar → encuesta_profesores_recorte.csv → Reemplazar hoja
   de cálculo → Separador: Coma → Importar datos`. **Pausar** y comentar: "esto es la **extracción**:
   traje el dato desde su origen".
4. **Ver la estructura (3 min).** Señalar las **17 columnas** y las **871 filas**. Ir al final de la hoja
   para mostrar el último registro. Preguntar: "¿cuántas columnas creen que hay?" y confirmar.
5. **Leer los encabezados (3 min).** Mostrar que las columnas se llaman `a0, a1, b2…`. Abrir el
   diccionario (`diccionario_recorte.md`) al costado y traducir en vivo 3 o 4 códigos:
   `a1` = sexo, `a2` = edad, `a3` = departamento, `h3` = ¿sabe qué son los datos abiertos?.
6. **Observar la calidad (3 min).** Filtrar o buscar `NA` en la columna `g21` y mostrar vacíos en `e7`.
   Comentar: "el dato llegó, pero no está limpio; eso lo trabajaremos en la próxima sesión".
7. **Cerrar (2 min).** Repetir los dos extremos: "extraje la fuente y la dejé **cargada** en la hoja.
   El método fue **batch**; la herramienta, un **conector** de la propia planilla".

> **Consejo de pantalla:** aumentar el zoom del navegador (Ctrl/Cmd + `+`) y usar el puntero para señalar
> filas y columnas. Si la conexión se degrada, dejar la hoja de demostración preparada y seguir sin
> depender de la descarga.

---

## Opcional — Conectar a una fuente en línea (sin descargar)

Para mostrar una conexión "en vivo" al portal de datos abiertos:

- **Google Sheets:** en la celda `A1`, escribir
  `=IMPORTDATA("https://datos.gob.bo/dataset/bf97cf5a-a8d3-4694-926c-2a3da3df40e5/resource/119afffe-8e0a-4657-9cea-40fd6837b90c/download/profesores_fin.csv")`
  (son 189 columnas: puede tardar; si falla, usar el recorte).
- **Excel:** `Datos → Obtener datos → Desde la web` y pegar la misma URL.

**Idea para la pizarra:** "acá no descargamos a mano: la hoja **va a buscar** el dato a la fuente. Eso
se llama **pull**; si la fuente los enviara sola, sería **push**".

> **Ojo con la sintaxis:** `IMPORTDATA` recibe **solo la URL** — sin delimitador ni codificación
> (`=IMPORTDATA("https://…/archivo.csv")`). Si le agregas argumentos como `utf-8`, devuelve error.
>
> **Ojo con el servidor:** `datos.gob.bo` **bloquea al robot de Google** (responde `403 Forbidden`),
> así que `IMPORTDATA` puede fallar aunque la URL esté bien. Si eso pasa, **importa el CSV descargado**
> (`Archivo → Importar`) o usa el script de Apps Script de la sección siguiente.

## Conexión en vivo con Apps Script (alternativa robusta)

Como `datos.gob.bo` bloquea al robot de Google, `IMPORTDATA` puede no funcionar; en cambio un script
propio **sí** (su *User-Agent* no está bloqueado).

1. En la hoja: `Extensiones → Apps Script`.
2. Pegar y guardar esta función:

```javascript
function IMPORTAR_CSV(url) {
  const resp = UrlFetchApp.fetch(url, { muteHttpExceptions: true });
  return Utilities.parseCsv(resp.getContentText());
}
```

3. Volver a la hoja y usarla, por ejemplo:

```text
=IMPORTAR_CSV("https://datos.gob.bo/dataset/5709224f-b120-4ec9-aee6-d9d4ecee305c/resource/41d6a324-8d0c-4261-8bcf-94b5c86cd440/download/directores_inicial_1fase.csv")
```

> Los datos así traídos son **valores**: no se actualizan solos. Para refrescar, hay que volver a
> ejecutar la función. Es una buena ocasión para contrastar **pull manual** con una **conexión programada**.

---

## Problemas frecuentes (y qué hacer)

| Síntoma | Causa | Solución |
|---|---|---|
| Acentos que se ven mal (p. ej., "Profesión" con caracteres extraños) | Codificación distinta a UTF-8 | Volver a importar eligiendo UTF-8 (Excel) o no cambiar la codificación (Sheets). |
| Todo en **una sola columna** | Separador equivocado | Reimportar eligiendo **Coma** como separador. |
| No aparece el archivo | No lo descargó de Moodle | Compartir el enlace por el chat y descargar en el momento. |
| `IMPORTDATA` da "error de argumentos" | Se le pasaron delimitador o codificación | `IMPORTDATA` solo lleva **la URL**: `=IMPORTDATA("https://.../archivo.csv")`. La codificación **no** se configura (la determina el archivo). |
| `IMPORTDATA` "no puede obtener la URL" (o `#N/A`) y la URL se abre bien en el navegador | El servidor bloquea al robot de Google (`403`) | Importar el CSV descargado (`Archivo → Importar`) o usar el script de Apps Script. |

## Verificación y entrega

| Criterio | Evidencia |
|---|---|
| Conectó la fuente | La hoja muestra los datos importados |
| Reconoce la estructura | Indica 871 filas × 17 columnas |
| Interpreta los encabezados | Traduce al menos 3 códigos con el diccionario |
| Distingue método y herramienta | Menciona batch y conector |

**Entrega:** una **captura de pantalla** de la hoja con los datos visibles y **una frase** con la
estructura (filas × columnas), el método y la herramienta usados.
