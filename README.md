# E-Commerce Data Pipeline Project

Repositorio para practicar un pipeline de datos completo sobre el dataset [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

---

## 📑 Descripción

Este proyecto simula el flujo de datos de una tienda online, desde la ingestión de datos brutos hasta la orquestación y despliegue de un pipeline de ETL:

1. **Modelado y consultas SQL avanzadas** (PostgreSQL)
2. **Procesamiento y transformación** con Pandas y PySpark
3. **Visualización de datos** con Matplotlib, Seaborn y Plotly
4. **Estructura ETL** en Python (`extract()`, `transform()`, `load()`)
5. **Orquestación** con Apache Airflow
6. **Contenerización** con Docker

---

## 📂 Estructura del repositorio

```bash
project/
├─ data/olist_dataset/       # CSV originales (NO versionar)
├─ sql/                      # Scripts .sql (schema, índices, cargas COPY)
├─ notebooks/                # Jupyter notebooks de exploración y pandas
├─ etl/                      # Scripts Python (extract, transform, load)
├─ spark/                    # Scripts PySpark
├─ airflow/                  # DAGs, configuración y Dockerfile de Airflow
├─ tests/                    # Tests con pytest
├─ .github/                  # GitHub Actions (CI)
├─ .gitignore                # Archivos/carpetas ignorados
├─ requirements.txt          # Dependencias Python
└─ README.md                 # Documentación general
```

---

## TO DO: Incluir en el README:

- **Descripción** breve y contexto del proyecto.
- **Requisitos** (Python, PostgreSQL, versiones).
- **Estructura de carpetas** clara.
- **Guía de instalación** paso a paso.
- **Cómo ejecutar** ETL, notebooks y DAGs de Airflow.
- **Testing**: cómo ejecutar `pytest`.
- **Contribución** y formato de commits.
- **Licencia** y contacto.
