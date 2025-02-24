
# Vault Service Configuration in Dockerlab

## Introduction
This section provides details on how the Vault service is configured and integrated into the Dockerlab environment, where it uses Consul as its backend for storing secrets and other data.

---

## Vault Service in `docker-compose.yml`
The Vault service is defined in the `docker-compose.yml` file as follows:

```yaml
vault:
  image: hashicorp/vault:latest
  container_name: vault
  ports:
    - "8200:8200"
  environment:
    - VAULT_DEV_ROOT_TOKEN_ID=root
    - VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200
    - VAULT_STORAGE_CONSUL_ADDRESS=consul-1:8500  # Vault using Consul as backend
    - VAULT_API_ADDR=http://vault:8200
  command: "server -dev -dev-root-token-id=root"
  volumes:
    - vault_data:/vault/data
  networks:
    - dockerlab
  depends_on:
    - consul-1
  healthcheck:
    test: ["CMD", "curl", "-f", "http://localhost:8200/v1/sys/health"]
    interval: 30s
    retries: 3
    start_period: 10s
```

### Key Configuration Details:
- **Image**: The latest version of the Vault image from HashiCorp.
- **Ports**: The Vault web interface is exposed on port `8200`.
- **Environment Variables**:
  - `VAULT_DEV_ROOT_TOKEN_ID=root`: Sets the root token for Vault in development mode.
  - `VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200`: Configures Vault to listen on all interfaces on port `8200`.
  - `VAULT_STORAGE_CONSUL_ADDRESS=consul-1:8500`: Vault uses Consul running on `consul-1` for storing its data.
  - `VAULT_API_ADDR=http://vault:8200`: Sets the Vault API address.
- **Command**: Starts Vault in development mode with a root token for quick testing.
- **Volumes**: The `vault_data` volume is used to persist Vault's data.
-**root token**: The root token is set to `root` for development purposes.
---

## Vault and Consul Integration
In this setup, Vault uses Consul as its storage backend. Consul ensures that Vault's data is highly available and stored persistently across multiple nodes.

### Vault Storage Configuration
The storage backend configuration is specified as:

```yaml
VAULT_STORAGE_CONSUL_ADDRESS=consul:8500
```

This instructs Vault to use the Consul agent running on `consul` (on port `8500`) as the backend for storing secrets and other data.

---

## Vault Web Interface
Once Vault is running, you can access its web interface by navigating to:

```bash
http://localhost:8200
```

Use the root token specified in the environment variable (`root`) to log in and manage secrets, policies, and other Vault configurations.

---


