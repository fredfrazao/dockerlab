#!/bin/bash

# Function to test if a service is running via HTTP request
test_service_availability() {
    services=(
        "Consul: http://localhost:8500/ui/dc1/overview/server-status"
        "alertmanager:http://localhost:9093/#/alerts"
        "Grafana: http://localhost:3000/login"
        "Vault: http://localhost:8200/ui/vault/auth?with=token"
        "kinana: http://localhost:9200/"
        "elastic: http://localhost:5601/app/home#/"
    )

    for service in "${services[@]}"; do
        name=$(echo $service | cut -d: -f1)
        url=$(echo $service | cut -d: -f2- | sed 's/^ //')  # Fix here: remove leading space from URL
        echo "Testing $name at $url"
        if ! curl -s --head --request GET $url | grep "200 OK" > /dev/null; then
            echo "Error: $name is not accessible at $url"
            exit 1
        fi
    done
}

# Function to check Docker containers are running
test_docker_containers() {
    containers=$(docker ps -q)
    if [ -z "$containers" ]; then
        echo "Error: No Docker containers are running."
        exit 1
    fi
    echo "Docker containers are running."
}

# Function to check Prometheus scraping targets
test_prometheus_scraping() {
    echo "Testing Prometheus scraping targets"
    response=$(curl -s http://localhost:9090/api/v1/targets)
    if [[ "$response" == *"activeTargets"* ]]; then
        echo "Prometheus scraping targets are valid."
    else
        echo "Error: Prometheus scraping failed."
        exit 1
    fi
}


# Run all tests
run_all_tests() {
    test_docker_containers
    test_service_availability
    test_prometheus_scraping


    echo "All tests passed successfully!"
}

# Execute the tests
run_all_tests
