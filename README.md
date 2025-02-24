# Docker Lab Setup

## Overview
Dockerlab - Monitoring and Logging Stack
This repository contains a Docker Compose setup for running a full monitoring and logging stack with various services like Consul, Vault, Prometheus, Grafana, Alertmanager, PostgreSQL, Fluentbit, Filebeat, Elasticsearch, and Kibana. This setup is designed to monitor, log, and visualize the state of your systems.

### Services Included
- **Consul**: A tool for service discovery and configuration management.
- **Vault**: A tool for secret management and data protection.
- **Prometheus**: A system monitoring and alerting toolkit.
- **Grafana**: A tool for visualizing time-series data from Prometheus.
- **Alertmanager**: Handles alerts sent by Prometheus.
- **PostgreSQL**: A relational database to store application data.
- **Fluentbit**: A lightweight log processor and forwarder.
- **Filebeat**: A log shipper for forwarding and centralizing log data.
- **Elasticsearch**: A distributed search and analytics engine for storing and querying logs.
- **Kibana**: A data visualization tool for Elasticsearch.

## Prerequisites
Before running the Docker Compose setup, ensure you have the following installed:

- Docker (https://www.docker.com/get-started)
- Docker Compose (https://docs.docker.com/compose/install/)
- Docker Desktop or Docker Engine running on your system

## Configuration Files
- `./configs/consul-config`: Consul configuration files.
- `./configs/prometheus/prometheus.yml`: Prometheus configuration for scraping metrics.
- `./configs/prometheus/alert.rules.yml`: Prometheus alerting rules.
- `./configs/grafana/datasources`: Grafana data sources configuration.
- `./configs/fluentbit/fluent-bit.conf`: Fluentbit configuration.
- `./configs/alertmanager/alertmanager.yml`: Alertmanager configuration.

Make sure to customize these configuration files according to your environment needs.

## Setting Up the Stack

Step 1: Clone the Repository
```sh 
git clone
```
Step 2: Update Configuration Files (Optional)
```sh                               

Customize the configuration files found in the ./configs folder for your specific needs.
For example, you can modify Prometheus' prometheus.yml to adjust the scrape intervals or add more targets.
```    
Step 3: Start the Services
```sh 
docker-compose up -d
```
Step 4: Accessing the Services
Once the services are up and running, you can access them using the following ports:

- **Consul**: http://localhost:8500 <br>
- **Vault**: http://localhost:8200 <br>
- **Prometheus**: http://localhost:9090 <br>
- **Grafana**: http://localhost:3000 (default credentials: admin / dockerlabadmin) <br>
- **Alertmanager**: http://localhost:9093 <br>
- **PostgreSQL**: localhost:5432 <br>
- **Elasticsearch**: http://localhost:9200 <br>
- **Kibana**: http://localhost:5601 <br>

Step 5: Stopping the Services
To stop the services, run:
```sh 
 docker-compose down
```

### Volumes
This setup uses named volumes to persist data across restarts:

prometheus_data: Prometheus data storage <br>
grafana_data: Grafana data storage <br>
consul_data: Consul data storage <br>
vault_data: Vault data storage <br>
postgres_data: PostgreSQL data storage <br>
es_data: Elasticsearch data storage <br>


#### More specific instructions can be found in the respective service documentation directories.