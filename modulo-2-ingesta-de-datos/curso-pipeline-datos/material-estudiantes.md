# Actividad: Pipeline de ingeniería de datos — Extraer → Transformar → Cargar

Obra colectiva del curso 🛠️ · Sesión sincrónica · ¡No se necesita experiencia previa!

## 🎯 La misión

Hoy construís **tu primer pipeline de datos** y va a funcionar de verdad: vas a tomar datos reales de dos fuentes distintas de internet, darles forma para que "hablen el mismo idioma", y escribir **ambas en una misma tabla** de NocoDB — como lo haría un equipo de datos en una empresa.

```
  ⬇️ EXTRACT          🔄 TRANSFORM            ⬆️ LOAD
 dos APIs públicas → mismas columnas y →  una tabla en
 (Banco Mundial y    el mismo formato    NocoDB (cloud
  REST Countries)     de fila             gratuita)
```

**La tabla final:** una fila **por país y por fuente** (dos filas por país). ¿Por qué la columna `fuente`? Porque al final vas a comparar si las dos fuentes dicen lo mismo... spoiler: a veces no 🤨 y eso es una conversación súper real del mundo de datos.

## 0. Lo que necesitás antes de empezar

1. ✅ Cuenta en **app.nocodb.com** (plan gratis, no pide tarjeta). Pedíte al docente la base/tabla de trabajo, la vas a ver en tu workspace.
2. ✅ Cuenta gratis en **restcountries.com** (botón "Sign up free") y tu **API key** personal (~249 países, 1.000 requests/mes que nunca vas a consumir en esta clase — por eso cada quien la suya).
3. ✅ Un navegador con internet. Git ni programación: hoy el código está escrito, vos lo ejecutás y lo modificás poco a poco.

## 1. Los datos que vamos a usar

| | Fuente A | Fuente B |
|---|---|---|
| Qué es | API del **Banco Mundial** (indicadores mundiales) | API **REST Countries** (enciclopedia de países) |
| Necesita clave | ❌ No — es pública | ✅ Sí — tu key gratuita |
| Qué aporta | Población por país (último año) | Nombre, capital, región y también población |
| Clave de país | Código ISO3 (`ARG`, `BRA`…) | Código ISO3 (`codes.alpha_3`) |

> 🧠 **Dato importante:** el Banco Mundial incluye en sus listas también "países" que son **agrupaciones** (Latin America & The Caribbean, World, etc.). Uno de los pasos de transformación será limpiarlas — así se "ensucia" la vida real.

## 2. Esquema de la tabla destino (en NocoDB)

Cada fuente va a producir filas con estos **mismos campos**, esa es la magia de "quedar en una misma tabla":

`codigo_iso3` · `nombre_pais` · `anio` · `poblacion` · `fuente`  *(fuente = nombre de la API que dio la fila)*

## 3. Elegí tu ruta (o hacé las dos si vas a toda velocidad 🚀)

### 🐍 Ruta Colab — Google Colab

1. Abrí el notebook compartido por el docente → **File > Save a copy in Drive** (así cada quien edita el suyo).
2. Panel 🔑 Secrets (en la barra izquierda): creá `NOCODB_TOKEN` y `RESTCOUNTRIES_KEY` con tus dos claves. **Nunca pegues claves dentro del código del notebook.**
3. **Extract:** ejecutas celda por celda. Banco Mundial = 1 sola llamada; REST Countries = 3 llamadas pequeñas paginadas con tu key en el header `Authorization`.
4. **Transform:** corré las celdas de pandas. Vas a *ver* con `df.head()` como cambian las formas: una fuente trae +37 columnas, después del paso quedan 5.
5. **Load:** la última celda hace el `POST` hacia `.../api/v2/tables/<TU_TABLA>/records` con todas las filas **de una sola llamada**. Si el resultado es verde → abrí la tabla en NocoDB y mirá tus datos 👀.

### 🧩 Ruta n8n — workflow visual

1. Abrí tu instancia n8n y descargá/importá el workflow que el docente comparte (o armalo siguiendo el diagrama de la pizarra).
2. **Extract:** dos nodos **HTTP Request** (uno por fuente) — vas a completar vos: la URL, el header con tu key y en el de NocoDB la credential (Host: `https://app.nocodb.com` + tu API token).
3. **Transform:** nodos **Code** (JavaScript, copiando de la guía) que parten el array de la respuesta en "items", se quedan con los campos que importan y agregan la columna `fuente`.
4. **Merge en modo Append** para juntar ambas ramas.
5. **Load:** nodo **NocoDB → Row → Create**. Presioná **Execute workflow** y mirá pasar los items por el cable 🪄.
6. Ojo: se inserta ~1 fila por llamada API; con 500 filas eso son muchas llamadas — si el tiempo aprieta o la cuota preocupa, el docente tiene la variante "bulk insert" (todas las filas en pocas llamadas).

## 4. Errores que ES NORMAL ver hoy (y qué significan)

| Código | Qué significa | Primera acción |
|---|---|---|
| `301 / mensaje de "deprecated"` | Usaste una URL vieja de REST Countries (las versiones ≤4 quedaron apagadas). | Usá la URL del material (v5 es la viva). |
| `401` | Token mal copiado, expirado o sin el header correcto. | Re-generá el token, revisá el header `xc-token` / `Authorization: Bearer`. |
| `403` | El token existe pero no tiene permiso de escritura en esa base. | Chequeá los scopes del token en NocoDB. |
| `422` | Las filas que envías no coinciden con los campos de la tabla (nombre de columna ≠ nombre de campo). | Revisá el `rename` / mapeo de columnas. |
| `429` | Demasiadas llamadas muy rápido (REST Countries: ~20 por 10 s). | Esperá unos segundos y volvé a ejecutar. |
| ⏹ se cuelga sin dar errores | Falta timeout en la llamada. | El notebook/guía ya trae `timeout=`: no lo borres 😅. |

## 5. Al terminar, discutimos en vivo

- 🤔 ¿Las poblaciones de ambas fuentes coinciden para el mismo país y año? ¿Por qué casi nunca al 100 %?
- 🤔 ¿Qué pasa si mañana una fuente cambia su formato (spoiler: nos pasó con REST Countries en la versión vieja)?
- 🤔 ¿Compartir claves o no? ¿Dónde se guardan "bien" las claves?
- 🤔 ¿Cuántas llamadas API gastamos en total? ¿Por qué importa en servicios con cuotas?

## 6. Mini-glosario

- **ETL:** Extract, Transform, Load — extraer, transformar, cargar. Todo pipeline de datos es, en algún nivel, esto.
- **API:** "puerta" por la que un programa pide datos a otro. Hoy usamos 3 (dos de datos y una de NocoDB).
- **API key:** identificador personal para que la API sepa quién gasta la cuota.
- **Rate limit / cuota:** cant. máxima de llamadas por tiempo (segundo/día/mes).
- **Bulk insert:** enviar muchas filas en una sola llamada en vez de una por fila.
- **Merge key / ISO3:** código de 3 letras internacional por país, la clave que permite unir fuentes.

¡Listo? Cargá tu primera fila de datos del mundo real 🌍
