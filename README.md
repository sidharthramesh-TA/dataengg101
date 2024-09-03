
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

## What do Data Engineers Do?

Data engineers are responsible for building and maintaining the infrastructure that enables Extract, Transformation and Loading of Data into a Data Warehouse.
They work closely with source systems and business analysts to ensure that required data is made available in a accurate and consistently refreshed manner for analysis.

## Data Engineering Lifecycle

While Data Engineers do write code logic for ETL, they also have to mess with Operations and infrastructure from time to time

<insert pic>

Operations ensure that Data is refreshed consistently in the Data warehouse for reporting and analytics to work. 

Infrastructure means the underlying systems that support the data warehouse. This could be on-prem or cloud based. These days most companies are moving to cloud based infrastructure.

Some famous Cloud providers are AWS and Azure. Diving into these cloud providers is a whole different talk in itself. for our purposes we will be using a local postgresql database.

