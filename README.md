# ETL Pipeline con Python y PostgreSQL

Proyecto de pipeline ETL (Extract, Transform, Load) para integración y normalización de datos, utilizando Python y PostgreSQL (gestionado con pgAdmin) para la extracción, transformación y su posterior carga y análisis de datos.

---

## Índice

1. [Descripción general](#descripción-general)
2. [Estructura del proyecto](#estructura-del-proyecto)
3. [Recursos y tecnologías utilizadas](#recursos-y-tecnologías-utilizadas)
4. [Instalación y configuración](#instalación-y-configuración)
5. [Pipeline ETL](#pipeline-etl)
   - [1. Extracción](#1-extracción)
   - [2. Transformación](#2-transformación)
   - [3. Carga](#3-carga)
6. [Automatización y orquestación](#automatización-y-orquestación)
7. [Próximos pasos](#próximos-pasos)
8. [Autor](#autor)

---

## Descripción general

Este proyecto muestra cómo construir un pipeline ETL profesional, desde la extracción de archivos en distintos formatos, su transformación y normalización, hasta la carga en una base de datos relacional. El objetivo es facilitar la integración de datos heterogéneos y su posterior análisis, siguiendo buenas prácticas de arquitectura de datos.

---

## Estructura del proyecto

```
etl-pipeline-postgresql/
│
├── import/                  # Archivos fuente (Excel, CSV, etc.)
│   └── output/              # Archivos CSV normalizados
│
├── scripts/                 # Scripts Python para ETL
│   ├── columnas.txt         # Nombres de columnas extraídos
│   ├── columns.py           # Extrae nombres de columnas
│   ├── delimitador.py       # Normaliza delimitadores
│   ├── to_csv.py            # Convierte Excel a CSV
│
├── 1-creacion_tablas.sql    # Script para crear tablas en el esquema RAW
├── 2-ingesta_tablas.sql     # Script para cargar datos en las tablas RAW
│
├── docker-compose.yaml      # Levanta PostgreSQL y pgAdmin
├── README.md                # Documentación del proyecto
└── requirements.txt         # Dependencias Python (opcional)
```

---

## Recursos y tecnologías utilizadas

- **Python 3.13.1**: Para scripts de extracción y transformación.
  - pandas
  - openpyxl
  - csv
- **PostgreSQL**: Base de datos relacional.
- **pgAdmin**: Interfaz web para administración de PostgreSQL.
- **Docker & Docker Compose**: Para levantar servicios de base de datos y pgAdmin.
- **Git & GitHub**: Control de versiones y portfolio.

---

## Instalación y configuración

1. **Clonar el repositorio**

   ```sh
   git clonehttps://github.com/AgusScorti/etl-pipeline-postgresql.git
   cd etl-pipeline-postgresql
   ```

2. **Instalar dependencias de Python**

   ```sh
   pip install -r requirements.txt
   ```

3. **Levantar servicios de base de datos y pgAdmin**

   ```sh
   docker-compose up -d
   ```

4. **Configurar variables de entorno** (si es necesario, para conexión a la base de datos).

---

## Pipeline ETL

### 1. Extracción

- **Conversión de archivos Excel a CSV:**  
  El script `to_csv.py` convierte todos los archivos `.xlsx` de la carpeta `import/` a `.csv`.

  ```sh
  python scripts/to_csv.py
  ```

- **Normalización de delimitadores:**  
  El script `delimitador.py` detecta y normaliza los delimitadores de los archivos `.csv` a punto y coma (`;`), guardando los resultados en `import/output/`.

  ```sh
  python scripts/delimitador.py
  ```

- **Extracción de nombres de columnas:**  
  El script `columns.py` recorre los archivos normalizados y extrae los nombres de columnas a `columnas.txt`.

  ```sh
  python scripts/columns.py
  ```

- **Carga inicial en base de datos RAW:**  
  La carga de los archivos CSV en la base de datos RAW se realizó en las siguientes etapas:

  1. **[Creación de tablas](1-creacion_tablas.sql):**  
     Se crearon las tablas en el esquema `raw` utilizando el script `1-creacion_tablas.sql`.

  2. **[Ingesta de datos](2-ingesta_tablas.sql):**  
     Se cargaron los datos desde los archivos CSV a las tablas creadas utilizando el script `2-ingesta_tablas.sql`.

  En esta base se almacenan los datos tal como llegan, sin modificaciones, para asegurar la trazabilidad y facilitar auditorías.

### 2. Transformación

- **Procesamiento en base de datos STAGING:**  
  Los datos de la base RAW se migran a una base STAGING, donde se realiza la limpieza, transformación y normalización de las tablas.  
  Ejemplos de transformación:
  - Limpieza de valores nulos o inconsistentes
  - Conversión de tipos de datos
  - Normalización de nombres y formatos
  - Enriquecimiento de datos

### 3. Carga

- **Carga en base de datos DATAWAREHOUSE (DWH):**  
  Finalmente, los datos limpios y normalizados se cargan en una base de datos Datawarehouse, diseñada con un esquema copo de nieve (snowflake schema) para optimizar el análisis y la consulta de grandes volúmenes de datos.

  - Creación de tablas de hechos y dimensiones
  - Integridad referencial
  - Optimización para BI y reporting

---

## Automatización y orquestación

_Próximamente..._  
Se podrá agregar un script principal o un Makefile para automatizar la ejecución de todo el pipeline.

---

## Próximos pasos

- Documentar la transformación y carga.
- Agregar ejemplos de consultas SQL y análisis.
- Mejorar la automatización.

---

## Autor

Agustín  
[\[LinkedIn\]](https://www.linkedin.com/in/agustinscorticati/)

---

**Este README se irá actualizando a medida que avance el desarrollo del proyecto.**
