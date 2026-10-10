# Integración de Datos — Glosario (Bloque 4, IDT 601)

Lenguaje canónico del workspace. Todas las lecciones y ejercicios usan estos términos.

## Términos

**Integración de datos**:
Reunir datos de fuentes distintas en un destino común y coherente.
_Avoid_: mezcla, unificación de todo

**Extraer**:
Leer y tomar los datos desde la fuente original.
_Avoid_: descargar, jalar

**Transformar**:
Limpiar, ordenar y convertir los datos a un formato común.
_Avoid_: cambiar, editar

**Cargar**:
Escribir los datos ya transformados en el destino final.
_Avoid_: subir, guardar

**ETL**:
Extraer → Transformar → Cargar: se transforma antes de guardar.
_Avoid_: proceso de datos

**ELT**:
Extraer → Cargar → Transformar: se guarda primero y se transforma después.
_Avoid_: ETL mal ordenado

**Pipeline (flujo de datos)**:
Secuencia de etapas por las que pasa el dato, de la fuente al uso.
_Avoid_: tubería, cadena

**Limpieza de datos**:
Tareas de la transformación que corrigen, unifican, deduplican y marcan faltantes.
_Avoid_: depuración, purga

**Duplicado**:
Registro que aparece repetido por un error de carga o de origen.
_Avoid_: copia, repetido

**Valor faltante**:
Dato que no fue registrado; se completa o se marca, pero no se inventa.
_Avoid_: vacío, hueco

**Automatización**:
Hacer que una tarea se ejecute sola, sin intervención manual.
_Avoid_: robotización, delegación

**Orquestación**:
Coordinar varias tareas dependientes en el orden correcto, con reintentos y avisos.
_Avoid_: coordinación, manejo

**Dependencia**:
Relación en que una tarea no puede empezar hasta que termina otra.
_Avoid_: requisito, enlace

**Reintento**:
Volver a ejecutar una tarea que falló, antes de darla por perdida.
_Avoid_: repetición, segundo intento

**DAG (grafo dirigido acíclico)**:
Forma de dibujar un flujo: cada nodo es una tarea y las flechas marcan el orden.
_Avoid_: diagrama, organigrama

**Trazabilidad**:
Registro de qué corrió, cuándo y con qué resultado (el log de ejecución).
_Avoid_: historial, seguimiento

**Cron**:
Programador de tareas del sistema operativo: define una frecuencia y un comando.
_Avoid_: temporizador, agenda

**Apache Airflow**:
Plataforma de orquestación de flujos; los define como DAGs con interfaz, reintentos y alertas.
_Avoid_: herramienta de ETL
