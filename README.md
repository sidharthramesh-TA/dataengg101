
# Data Engineering 101

Hello and welcome to the Data Engineering 101 talk! 
Today we will be discussing the basics of data engineering, what it is, and why we need it. 
At the end of this talk you should 

    1) have a better understanding of what data engineering is and its place in the Analytics Valuechain
    2) Know the basics of Data Warehouse and ETL
    3) Be able to build a simple data pipeline using Pandas, and postgresql.
    4) Learn about some tools used in data engineering.

## What is Data Engineering?

Data engineering is a critical component of data science and analytics, as it provides the foundation for data-driven decision-making.
It involves the design and creation of systems for collecting and storing data. 

![alt text](/pics/DE1.jpeg)

## What do Data Engineers Do?

Data engineers are responsible for building and maintaining the infrastructure that enables Extract, Transformation and Loading of Data into a Data Warehouse.
They work closely with source systems and business analysts to ensure that required data is made available in a accurate and consistently refreshed manner for analysis.

![alt text](/pics/DE8.jpeg)

## Analytics Valuechain

While Data Engineering is a critical component of the Analytics Valuechain, it is not the only component. Value from data is harvested when data is turned into insights which can later on be acted on.

![alt text](/pics/DE4.jpeg)

We note from the picture that Data Engineering takes a lot of Time and Effort, but its not a lot of value intrinsically to store data into tables. 
But accurate and consistent data is high quality input for analysis and higher value can be harvested.

## Data Engineering Lifecycle

While Data Engineers do write code logic for ETL, they also have to mess with Operations and infrastructure from time to time

![alt text](/pics/DE7.jpeg)

Operations ensure that Data is refreshed consistently in the Data warehouse for reporting and analytics to work. 

Infrastructure means the underlying systems that support the data warehouse. This could be on-prem or cloud based. These days most companies are moving to cloud based infrastructure.

Some famous Cloud providers are AWS and Azure. Diving into these cloud providers is a whole different talk in itself. for our purposes we will be using a local postgresql database.

## ETL

ETL stands for Extract, Transform, Load. 
It is the process of extracting data from source systems, transforming it into a format that is suitable for analysis, and loading it into a data warehouse.
This is the core function of a data engineer.
Now this process can be done in many ways, and there are many tools available to help with this process.
Majority of the time, data engineers use SQL for this process. That is if data is already in a database. If it is not in a database, then they have to write code to extract data from source systems.

![alt text](/pics/DE2.jpeg)

We will see how Python Pandas can be used in the Demo to extract data from a csv file and load it into a postgresql database.

## Data Warehouse

A data warehouse is a central repository for storing and managing data from multiple sources.
It is designed to support business intelligence and analytics applications by providing a single, unified view of the data.
Data warehouses are typically optimized for read-heavy workloads and are used for reporting and analysis.

### How is a Data Warehouse different from a Database?

A data warehouse is different from a database in that it is designed to store and manage large volumes of data from multiple sources.
It is optimized for read-heavy workloads and is typically used for reporting and analysis.
A database, on the other hand, is designed to store and manage data for transactional applications and is optimized for write-heavy workloads.

![alt text](/pics/DE5.jpeg)

## Demo

![alt text](/pics/DE6.jpeg)

In this demo, we will be building a simple data pipeline for a retail company using Pandas and postgresql.
We will 

1) extract data from a csv file using Python Pandas and loading it into a postgresql landing table
2) Transform the data in the landing table and load it into a staging table
3) Transform the data in the staging table and load it into a Dimension and a fact table
4) Make a cron job to refresh the data in the data warehouse every day
5) Build a simple report using PowerBI to visualize the data

## Common Tools used in Data Engineering

There are many tools available to help data engineers with their work.
Some of the most common tools used in data engineering are:
```
    1) Apache Spark
    2) Airflow
    3) dbt
    4) SSIS
    5) Informatica
    6) Matillion
    7) Stitch
    8) Fivetran
    9) AWS Glue
    10) Azure Data Factory
    12) Google Cloud Dataflow
    13) Snowflake
    14) Databricks
```

# References

1) Data Engineering with Python by Paul Crickard Publisher: Packt Publishing
2) Fundamentals of Data Engineering by Joe Reis, Matt Housley Publisher: O'Reilly Media
3) [Complete Guide to Python for Data Engg](https://www.linkedin.com/learning/complete-guide-to-python-for-data-engineering-from-beginner-to-advanced/)
4) [Complete Guide to SQL for Data Engg](https://www.linkedin.com/learning/complete-guide-to-sql-for-data-engineering-from-beginner-to-advanced/)
5) [Data Engg pipeline with Apache Airflow](https://www.linkedin.com/learning/data-engineering-pipeline-management-with-apache-airflow/)

