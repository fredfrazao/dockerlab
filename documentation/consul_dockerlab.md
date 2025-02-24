
# README: Setting Up Consul in Dockerlab

## Registering a New Service in Consul
To register a new service with Consul, create a JSON service definition file. For example, create a file named `web-service.json`:

```json
{
  "service": {
    "id": "web-1",
    "name": "web",
    "tags": ["primary"],
    "port": 8080,
    "check": {
      "http": "http://localhost:8080/health",
      "interval": "10s"
    }
  }
}
```

### Register the Service
To register the service, run:

```sh
docker exec -it consul consul services register /path/to/web-service.json
```

### Verify the Registration
After registration, verify that the service is available in Consul:

```sh
docker exec -it consul consul catalog services
```
Or check via the API:

```sh
curl http://localhost:8500/v1/catalog/services | jq
```

---


## Checking Consul Logs
To check logs and debug issues, run:

```sh
docker logs -f consul
```

---

## Stopping Consul
To stop the Consul cluster, run:

```sh
docker-compose down consul
```
This will shut down all Consul nodes while preserving stored data.

---

