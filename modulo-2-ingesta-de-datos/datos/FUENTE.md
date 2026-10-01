# Fuente de datos — Encuesta Final-Profesores de Inclusión Digital

**Origen:** Datos Abiertos Bolivia (portal oficial, gestionado por AGETIC).
**Autor:** Agencia de Gobierno Electrónico y Tecnologías de Información y Comunicación (AGETIC).
**Título:** Encuesta Final-Profesores de Inclusión Digital.
**Publicado:** 9 de diciembre de 2019.
**Licencia:** Creative Commons Attribution (CC-BY) — cumple la Open Definition.

## Enlaces

- Ficha del conjunto: <https://datos.gob.bo/dataset/encuesta-final-profesores-inclusion-digital>
- CSV completo (189 columnas): <https://datos.gob.bo/dataset/bf97cf5a-a8d3-4694-926c-2a3da3df40e5/resource/119afffe-8e0a-4657-9cea-40fd6837b90c/download/profesores_fin.csv>
- Diccionario de variables (ODS): <https://datos.gob.bo/dataset/bf97cf5a-a8d3-4694-926c-2a3da3df40e5/resource/2a793fbc-e231-431d-96ea-83c35752c399/download/diccionario-de-variables-final-profesores.ods>

## Archivos locales en esta carpeta

| Archivo | Qué es |
|---|---|
| `encuesta_profesores_completo.csv` | El CSV original descargado, 871 filas × 189 columnas (encabezados codificados). |
| `encuesta_profesores_recorte.csv` | **Recorte para la práctica**: 871 filas × 17 columnas relevantes, con los **códigos originales** de encabezado y los valores tal como vienen (incluidos `NA`, `N/A` y vacíos). |
| `diccionario_recorte.md` | Diccionario de las 17 columnas del recorte: código → pregunta → valores. |
| `README_cita.txt` | Texto de atribución listo para pegar en los materiales. |

## Sobre la otra fuente consultada

`https://opendatabolivia.github.io/` (iniciativa de Fundación ARU) es un **portal de indicadores** por
departamento y municipio, construido sobre censos, encuestas de hogares y registros administrativos,
con **dashboards HTML generados en R**. **No ofrece CSV/JSON descargable listo para un pipeline**, por
lo que se recomienda como fuente de **consulta y contraste** (contexto), no para la práctica de ingesta.

## Atribución para los materiales

> Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*, Datos Abiertos Bolivia
> (datos.gob.bo, 2019). Licencia CC-BY.
