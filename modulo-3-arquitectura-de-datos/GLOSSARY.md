# Arquitectura de Datos — Glosario (Bloque 3, IDT 601)

Lenguaje canónico del workspace. Todas las lecciones y ejercicios usan estos términos.

## Términos

**Arquitectura de datos**:
Plano que define qué datos existen, dónde se guardan, cómo se mueven y quién los usa con qué reglas.
_Avoid_: infraestructura, diseño de sistemas

**Almacenamiento**:
Componente que responde dónde vive el dato y en qué forma.
_Avoid_: repositorio, base de datos

**Procesamiento**:
Componente que transforma y mueve los datos (limpieza, unión, cálculo).
_Avoid_: cálculo, ejecución

**Catálogo de datos**:
Inventario que documenta qué datos existen y qué significan.
_Avoid_: listado, inventario

**Metadatos**:
Datos que describen a los datos (definición, formato, dueño, origen).
_Avoid_: datos del dato

**Diccionario de datos**:
Forma concreta del catálogo: campo por campo, con definición y formato.
_Avoid_: glosario, tabla de campos

**Gobernanza de datos**:
Reglas y responsables sobre calidad, acceso, seguridad y uso.
_Avoid_: administración, control

**Silo de datos**:
Datos encerrados en un área o sistema que los demás no ven.
_Avoid_: isla, compartimiento

**Capa transversal**:
Componente que atraviesa todo el flujo (catálogo y gobernanza), no una etapa.
_Avoid_: etapa, paso

**Patrón de arquitectura**:
Forma típica y probada de organizar los datos para un propósito.
_Avoid_: modelo, estilo

**Data warehouse**:
Almacén de datos procesados y estructurados, listos para reportar.
_Avoid_: bodega, depósito

**Data lake**:
Repositorio de datos crudos y diversos, en cualquier formato.
_Avoid_: repositorio crudo

**Data lakehouse**:
Combinación de lake y warehouse: crudo + esquema y gobierno.
_Avoid_: warehouse-lake

**Arquitectura lambda**:
Patrón con dos caminos: capa batch y capa de velocidad.
_Avoid_: arquitectura por capas

**Capa batch (lotes)**:
Camino que procesa la historia completa cada cierto tiempo.
_Avoid_: capa lenta

**Capa de velocidad (tiempo real)**:
Camino que procesa lo que acaba de llegar, de inmediato.
_Avoid_: capa rápida

**Diseño de arquitectura**:
Proceso ordenado: entender el caso, mapear fuentes, definir componentes, elegir patrón y documentar.
_Avoid_: diagrama, plano
