# Integración de Datos — Recursos (Bloque 4, IDT 601)

Fuentes de confianza para preparar y dictar el Bloque 4. El conocimiento de las
lecciones se extrae de aquí, no de la memoria del agente.

## Knowledge

- **Libro:** _Diseño de aplicaciones con uso intensivo en datos_, Martin Kleppmann (Marcombo, 2022).
  Usar para: procesamiento por lotes y por flujos, y por qué se separa el procesamiento de la carga.
- **Libro:** _The Data Warehouse Toolkit_, Ralph Kimball y Margy Ross (Wiley).
  Usar para: fundamentos de la transformación y del ETL en la práctica.
- [Documentación oficial de Apache Airflow](https://airflow.apache.org/docs/)
  Fuente del proyecto (oficial). Usar para: DAGs, programación, reintentos y alertas.
- [Documentación oficial de dbt](https://docs.getdbt.com/)
  Fuente del proyecto (oficial). Usar para: ELT y por qué se transforma después de cargar.
- [Material de proveedor: IBM Think, _¿Qué es ETL?_](https://www.ibm.com/es-es/think/topics/etl)
  Usar para: panorama introductorio y vocabulario. **Es fuente de proveedor:** no citar sus cifras sin estudio de origen, año y muestra.
- [Wikipedia: _cron_](https://es.wikipedia.org/wiki/Cron)
  Usar para: sintaxis de la programación por frecuencia (`0 6 * * 1` = lunes 6:00).

## Wisdom (Communities)

- [r/dataengineering](https://reddit.com/r/dataengineering)
  Usar para: contrastar patrones de orquestación y ver casos reales.
- [Stack Overflow en español](https://es.stackoverflow.com/)
  Usar para: dudas puntuales sobre ETL/ELT, cron y orquestadores.
- Local: la cohorte del IDT 601 y la Unidad de Investigación y Desarrollo (EGPP).
  Usar para: probar explicaciones y el caso del taller con colegas antes de clase.

## Gaps

- Las herramientas de orquestación cambian rápido (Airflow 2.x → 3.x, Dagster, Prefect): revalidar
  versiones y vigencia antes de cada cohorte; no citar cifras de memoria.
- La frontera entre "ETL" y "ELT" se usa de forma laxa en la industria; conviene fijar la definición
  operativa (orden de las etapas) en cada fuente que se cite.
