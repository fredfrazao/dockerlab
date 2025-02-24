# Docker Lab Setup 

## Overview

This setup includes Dockerized services for **high availability (HA)** and **fault tolerance**, with monitoring, alerting, and centralized logging.

### Services Included:
- **Consul**: Service discovery, health checks, and coordination.
- **Vault**: Secrets management with **Raft protocol** for HA.
- **Prometheus**: Metrics collection and alerting.
- **Grafana**: Dashboards for visualization of metrics.
- **PostgreSQL**: Persistent storage with high availability.
- **alertmanager**: Alert management for Prometheus.

---


## Setup

1. **Running the Setup**:
    - Clone the repository
    - Start all services using the following command:
        ```sh
      docker-compose -f docker-compose.yml up -d

        ```
    - To check the status of the services, run:
        ```sh
        docker-compose ps
        ```

2. **Accessing the Services**:
    - **Consul UI**: http://localhost:8500
    - **Vault UI**: http://localhost:8200
    - **Prometheus UI**: http://localhost:9090
    - **Grafana UI**: http://localhost:3000 
    - **PostgreSQL**: localhost:432



#### More specific instructions can be found in the respective service documentation directories.