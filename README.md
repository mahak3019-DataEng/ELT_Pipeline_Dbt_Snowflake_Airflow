# Airbnb Data Transformation Project

## Overview

This project implements a data transformation pipeline for the Airbnb domain using **dbt** (data build tool), **Snowflake** as the data warehouse, and **Airflow** for orchestration. The goal is to create a robust analytical framework that enables easy exploration and reporting of Airbnb data.

### Key Components

- **dbt**: Utilized for transforming raw data into a structured format. The project includes both fact and dimension tables.
- **Snowflake**: Serves as the cloud data warehouse where all data is stored and processed.
- **Apache Airflow**: Orchestrated using the **Astro Cosmos** library, enabling automated scheduling and execution of data workflows.

### Prerequisites

- An active Snowflake account.
- dbt installed locally or through a cloud environment.
- Apache Airflow installed and configured.