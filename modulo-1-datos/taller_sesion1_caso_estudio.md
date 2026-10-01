# Caso de estudio — Gobierno Autónomo Municipal de Río Verde

**Dirección de Atención Ciudadana y Servicios**

> Material para el taller de la Sesión 1 (Bloque 1 — Datos), modalidad **online**. El caso es ficticio, pero representa situaciones típicas de la gestión pública.

---

## Cómo se trabaja en línea

- El docente comparte por el **chat** el enlace de este caso y de la **planilla colaborativa**.
- En **salas de 3–4**, cada equipo completa la planilla (una hoja por equipo).
- Cada equipo designa un **coordinador** y un **relator**; al final, el relator **comparte pantalla** en la puesta en común.

---

## Contexto

El Gobierno Autónomo Municipal de Río Verde atiende a 180 000 habitantes. Su **Dirección de Atención Ciudadana** recibe reclamos, otorga permisos y licencias, y coordina los servicios de alumbrado, agua y recaudación de impuestos. La dirección quiere mejorar la toma de decisiones, pero hoy no tiene claro **qué datos maneja, de dónde salen ni qué tan buenos son**.

Te pidieron (como parte del equipo de datos) levantar un **inventario de datos** para orientar el trabajo futuro.

---

## Los datos que maneja la Dirección

Lee la lista y, para cada dato, identifica **fuente** y **tipo**. Luego completa la planilla de inventario.

### 1. Reclamos registrados en el sistema de trámites
Cada reclamo se guarda en la base de datos interna con campos fijos: número de reclamo, DNI del ciudadano, zona, tipo de servicio, fecha y estado.

### 2. Reclamos recibidos por el formulario web
El portal recibe reclamos a través de un formulario en línea. Cada envío llega como un objeto JSON con etiquetas: tipo de reclamo, fecha, datos del ciudadano y un campo de descripción en texto libre.

### 3. Comentarios en redes sociales
Los ciudadanos publican reclamos y comentarios en la página de Facebook de la municipalidad. Son mensajes de texto libre, sin estructura fija, que se acumulan a diario.

### 4. Registro de las cámaras de tránsito
Las cámaras instaladas en los principales cruces graban video de forma continua para monitorear el tránsito.

### 5. Encuestas de satisfacción
Al cierre de cada trámite se envía una encuesta con preguntas de opción (calificación de 1 a 5) y un campo de comentario abierto.

### 6. Lectura de medidores de agua
Cada medidor de agua envía una lectura numérica cada hora, registrada automáticamente en una tabla de la base de datos.

### 7. Recaudación diaria de impuestos
El área de recaudación exporta cada día un archivo CSV con el total recaudado por impuesto y por zona.

### 8. Padrón de contribuyentes
La base de datos mantiene un padrón con los datos de los contribuyentes (nombre, dirección, actividad). Sin embargo, **hace más de tres años que no se actualiza**.

### 9. Actas escaneadas
Los permisos y licencias aprobados en papel se escanean y se guardan como archivos PDF en una carpeta compartida.

### 10. Registro de atenciones en papel
Algunas oficinas todavía anotan las atenciones diarias en cuadernos. Ese registro **no está digitalizado**.

---

## Preguntas guía para la discusión

1. ¿Cuáles de estos datos son **estructurados**, cuáles **semiestructurados** y cuáles **no estructurados**?
2. ¿Qué datos combinan más de un tipo? (pista: mira la encuesta y el formulario web).
3. ¿Qué **problemas de calidad** detectas? ¿De completitud, exactitud o actualidad?
4. ¿Qué decisión de la Dirección podría mejorar si resolvieran esos problemas?
