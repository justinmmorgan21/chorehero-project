#!/bin/bash

# Load environment variables from .env.prod in project root
source "$(dirname "$0")/../.env.prod"

# Generate the Kubernetes secret YAML file for production
kubectl create secret generic chorehero-secrets \
  --from-literal=DATABASE_URL="$DATABASE_URL" \
  --from-literal=POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  --from-literal=RAILS_MASTER_KEY="$RAILS_MASTER_KEY" \
  --dry-run=client -o yaml > k8s/chorehero-secrets.yaml

echo "✅ Production chorehero-secrets.yaml created at k8s/chorehero-secrets.yaml"
