# Notas del orador — Sesión 6
**Deck:** `deck-sesion-06.html` · 15 diapositivas · 180 min
**Tema:** Integración: ETL, automatización y orquestación

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Integración: ETL, automatización y orquestación
- Dar la bienvenida y encuadrar la sesión en el **Bloque 4 — Integración de Datos**, como continuación del Bloque 3 (arquitectura): ya sabemos dónde viven los datos, hoy aprendemos a moverlos y transformarlos.
- Anunciar la promesa: al terminar sabrán qué es **ETL/ELT**, cómo se limpian y preparan los datos, y cómo se hace que un proceso **corra solo, en orden y a tiempo**.
- Aclarar que el público no es especialista: no hace falta saber programar; el taller final es guiado paso a paso.
- Adelantar el recorrido: integrar y ETL, ETL vs. ELT, herramientas, limpieza, automatización y orquestación, y un taller de limpieza y diseño del flujo.
- **No olvidar:** avisar desde el arranque que hay una **pausa de 10 minutos** a mitad de sesión y que el último tramo es un **taller de 65 minutos** (limpiar los datos y diseñar el flujo que corre solo).

## Slide 2 — Hoja de ruta
- Recorrer los siete tramos con sus tiempos: integrar y ETL (20), ETL vs. ELT (15), herramientas (10), limpieza y automatización (25), orquestación (15), taller (65) y cierre (10).
- Señalar que el **taller (65 min)** es el corazón de la sesión: la mayor parte del tiempo se pasa haciendo, no escuchando.
- Ubicar la pausa de 10 minutos después del bloque de herramientas de integración.
- Aclarar que el taller final es **por equipos de 4 personas** y que se entrega un **diagrama de flujo + tabla de tareas**, sin programar.
- **No olvidar:** confirmar que el cierre reserva 10 minutos para preguntas y para el puente a la próxima sesión.

## Slide 3 — La pregunta del día
- Escribir las tres preguntas en la pizarra y dejarlas visibles toda la sesión: **qué es ETL/ELT**, **cómo se limpian los datos** y **cómo corre solo**.
- Lanzar el primer enganche: *"¿cuántos sistemas de su institución habría que juntar para armar un solo informe?"*.
- Lanzar el segundo: *"¿qué tarea repetitiva harían que se ejecute sola?"* y dejar que el grupo proponga ejemplos.
- Anotar 4 o 5 ejemplos en la pizarra y avisar que se retoman en el taller final.
- **No olvidar:** dejar claro que estas **tres preguntas ordenan la sesión** y se responden en el cierre.

## Slide 4 — Integrar datos
- Definir con palabras simples: integrar es **reunir datos de fuentes distintas** en un **destino común y coherente**.
- Contar el ejemplo del municipio: trámites en un sistema, recaudación en otro y reclamos en una planilla; integrados se cruzan en un solo tablero.
- Subrayar la consecuencia de no integrar: cada sistema cuenta su parte y **nadie tiene la foto completa**.
- Preguntar al grupo qué sistemas de su institución necesitarían cruzarse para armar un informe de gestión.
- **No olvidar:** instalar la idea de que los datos deben contar **una sola historia**, y anunciar que la herramienta clásica es el **ETL**.

## Slide 5 — Proceso ETL
- Dibujar en la pizarra el proceso en tres etapas y en orden: **E — Extraer → T — Transformar → L — Cargar**.
- Explicar cada etapa: extraer es **tomar el dato de la fuente** (bases, planillas, archivos, APIs); transformar es **limpiar y convertir**; cargar es **guardar listo** en el almacén.
- Usar el símil de la **planta de envasado**: recibe la materia prima, la lava y selecciona, y la despacha al depósito.
- Dar el ejemplo de las ventas de sucursales: tomarlas todas, unificar fechas y montos, y guardarlas en el almacén para los reportes.
- **No olvidar:** el resumen memorable **"tomar → arreglar → guardar"**: el producto final son **datos listos para usar**.

## Slide 6 — ETL vs. ELT
- Aclarar que el orden de las letras no es un detalle: cambia **cuándo** y **dónde** se transforman los datos.
- Explicar **ETL**: transforma antes de cargar; el destino queda ordenado desde el inicio, pero requiere un espacio intermedio y puede demorar con grandes volúmenes.
- Explicar **ELT**: carga primero en crudo y transforma después dentro del destino; carga rápida y flexible, pero exige un destino potente (nube o data lake).
- Contrastar con los ejemplos bolivianos: planillas de hospitales a formato común (**ETL**) y cajas de recaudación a un lago de datos (**ELT**).
- **No olvidar:** no hay uno mejor que otro: **depende del volumen y del destino**; los dos buscan dejar datos listos para usar.

## Slide 7 — Herramientas de integración
- Presentar las dos familias: **comerciales** (licencia pagada, interfaz visual, soporte) y **de código abierto** (gratuitas, más trabajo técnico).
- Nombrar ejemplos comerciales: Informatica, IBM DataStage, Azure Data Factory, AWS Glue.
- Nombrar ejemplos de código abierto: Airflow, NiFi, Pentaho (Kettle), dbt, Talend Open Studio.
- Traducir la tabla a la regla de elección: se decide por el **caso**, el **presupuesto** y el **equipo** disponible.
- **No olvidar:** lo importante es **entender qué hace cada herramienta**, no memorizar nombres.

## Slide 8 — Comerciales vs. código abierto
- Describir las **comerciales**: productos pagados con interfaz de arrastrar y conectar, soporte y capacitación; convienen con presupuesto y equipos poco técnicos.
- Describir las de **código abierto**: libres y gratuitas, mantenidas por la comunidad, con más control y adaptación a cambio de más trabajo técnico.
- Señalar el criterio de decisión: **presupuesto** frente a **capacidad técnica del equipo**.
- Preguntar quién conoce o usa alguna de estas herramientas en su institución.
- **No olvidar:** ninguna familia es "la correcta"; la elección es una **decisión institucional según el caso**.

## Slide 9 — Limpieza y preparación
- Enmarcar la limpieza como el corazón de la transformación: es donde **más tiempo se gasta** en un proyecto real.
- Recorrer las tareas concretas: **corregir** errores, **unificar** formatos, **eliminar duplicados**, **marcar faltantes** y **combinar tablas**.
- Dar el ejemplo del reporte mensual de reclamos: unificar "Macrodistrito Centro" y "centro", descartar duplicados y marcar "sin zona".
- Repetir la idea de la pizarra: **datos sucios producen reportes sucios**.
- **No olvidar:** limpiar no es opcional; decidir si los faltantes se completan o se excluyen, **sin inflar totales**.

## Slide 10 — Automatización
- Definir automatizar como hacer que **una tarea se ejecute sola**, sin que una persona la dispare cada vez.
- Explicar sus dos apoyos: **programar** cuándo debe correr y **avisar** si algo sale mal.
- Dar el ejemplo del reporte de recaudación que se genera solo **los lunes a las 6:00** y llega por correo a quien lo necesita.
- Lanzar la pregunta al grupo: *"¿qué tarea repetitiva de su trabajo harían que se ejecute sola?"* (reportes, respaldos, resúmenes).
- **No olvidar:** automatizar es **que corra solo**; la diferencia con orquestar aparece en el slide siguiente.

## Slide 11 — Orquestación
- Definir orquestar como **coordinar varias tareas** que dependen unas de otras, asegurando el **orden correcto**.
- Explicar qué maneja: **dependencias** (la tarea B espera a la A), **reintentos** y **avisos** ante fallas.
- Recorrer el ejemplo del flujo: descargar → transformar → cargar al almacén → enviar resumen.
- Usar el símil del **director de orquesta**: no toca instrumentos, pero asegura que cada músico entre a tiempo y en orden.
- **No olvidar:** si un paso falla, hay que **avisar y reintentar**: orquestar es que corra en orden y coordinado.

## Slide 12 — Herramientas de orquestación
- Presentar **cron** como el programador del sistema operativo: se define una **frecuencia** y un **comando**; leer `0 6 * * 1` = "todos los lunes a las 6:00".
- Aclarar que cron conviene para **tareas simples y aisladas**, sin dependencias complejas.
- Presentar **Apache Airflow** como plataforma de orquestación: flujos definidos como **DAGs**, con interfaz web, reintentos y alertas.
- Recorrer la tabla lado a lado (complejidad, dependencias, interfaz) e incluir los **programadores de nube** como punto medio.
- **No olvidar:** empezar simple: para una **tarea suelta, cron alcanza**; para **flujos complejos con aviso de fallas, Airflow**.

## Slide 13 — Taller: automatizar el pipeline
- Dar la consigna en dos partes: **limpiar y preparar** el CSV de reclamos (unificar canal, tipo y zona; quitar duplicados; marcar `SIN ZONA`; unificar fechas) y **diseñar el flujo que corre solo**.
- Recordar las cuatro preguntas del flujo: **frecuencia**, **orden y dependencias**, **qué pasa si falla** y **dónde queda la trazabilidad**.
- Presentar las variantes por equipo: A reporte mensual · B alerta temprana · C trazabilidad y auditoría.
- Explicar el entregable: **diagrama del flujo + tabla de tareas + regla de trazabilidad**, cerrado en la sesión. No se programa; se usa una hoja de cálculo.
- **No olvidar:** el insumo y la guía están en `modulo-4-integracion-de-datos/`; con grupos de poca base, usar el **Modo B** (demostración guionada) de la guía.

## Slide 14 — Cierre
- Sintetizar los tres pilares: **integrar** (ETL/ELT reúne los datos para que cuenten una sola historia), **limpiar** (corregir, unificar y combinar) y **orquestar** (que corra solo, en orden y con aviso).
- Reforzar por qué importa: **menos errores**, **ahorro de tiempo** y **trazabilidad** (se sabe qué corrió, cuándo y con qué resultado).
- Releer con el grupo la regla final: de lo simple (**cron**) a lo complejo (**Airflow**).
- Anticipar la próxima sesión: **licencias de datos y datos abiertos** — qué se puede usar, cómo se comparte y bajo qué condiciones.
- **No olvidar:** dejar un espacio real para preguntas antes de cerrar y recordar la entrega del taller (diagrama + tabla de tareas).

## Slide 15 — Gracias
- Agradecer la asistencia y la participación, en especial durante el taller.
- Recordar la idea final: **integrar, limpiar y hacer que corra solo, en orden y con aviso si falla**.
- Repetir el puente a la próxima sesión: **licencias de datos y datos abiertos**.
- Invitar a llevar sus dudas y a consultar la guía del taller y la plantilla de entrega.
- **No olvidar:** despedirse confirmando día y hora de la próxima sesión y dejando el canal de contacto del docente.
