# Ingesta de Datos — Glosario (Bloque 2, IDT 601)

Lenguaje canónico del workspace. Todas las lecciones y ejercicios usan estos términos.

## Términos

**Ingesta de datos**:
Proceso de tomar datos de una o varias fuentes y llevarlos a un destino donde se puedan almacenar, procesar o analizar.
_Avoid_: carga, importación, carga de datos

**Extracción**:
Tomar el dato de su origen (archivo, base de datos, API, sensor).
_Avoid_: descarga, lectura

**Carga**:
Llevar el dato ya disponible a su destino, en el formato acordado.
_Avoid_: guardado, volcado

**Batch (por lotes)**:
Ingesta que acumula datos y los mueve en bloques, a intervalos programados.
_Avoid_: de golpe, masiva

**Streaming (tiempo real)**:
Ingesta que mueve cada dato en cuanto se genera.
_Avoid_: en vivo, instantánea

**Conector**:
Pieza ya construida que sabe leer de una fuente o escribir en un destino específicos.
_Avoid_: plugin, adaptador

**Script**:
Código propio que realiza la extracción y la carga a medida.
_Avoid_: programita, rutina

**API**:
Puerta de acceso estandarizada que expone datos de un sistema para que otros los lean.
_Avoid_: interfaz, servicio

**Pipeline de ingesta**:
Secuencia repetible que lleva los datos de la fuente al destino: extraer → transformar → cargar → verificar.
_Avoid_: flujo, proceso

**Patrón de ingesta**:
Solución probada y reutilizable para un problema recurrente de ingesta.
_Avoid_: método, receta

**Carga completa (full load)**:
Patrón que mueve todo el conjunto cada vez y reemplaza lo anterior.
_Avoid_: carga total

**Carga incremental**:
Patrón que mueve solo lo nuevo o lo modificado desde la última carga.
_Avoid_: carga parcial

**CDC (captura de cambios)**:
Patrón en el que la propia fuente registra y entrega solo los cambios.
_Avoid_: sincronización, replicación

**Pull / Push**:
Pull = nuestro sistema va a buscar los datos; Push = la fuente nos envía los datos.
_Avoid_: jalar/empujar, consulta/envío

**Idempotencia**:
Propiedad por la que repetir una carga no produce datos duplicados ni corrompidos.
_Avoid_: repetible, seguro

**Verificación**:
Etapa que confirma que llegó lo que debía llegar (conteos, duplicados, valores sensatos).
_Avoid_: control, revisión
