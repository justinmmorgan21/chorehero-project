#!/bin/bash

# Load environment variables from .env.local in project root
source "$(dirname "$0")/../.env.local"

# Generate the Kubernetes secret using values from env
kubectl create secret generic chorehero-secrets \
  --from-literal=DATABASE_URL="$DATABASE_URL" \
  --from-literal=POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  --from-literal=RAILS_MASTER_KEY="$RAILS_MASTER_KEY" \
  --dry-run=client -o yaml > k8s/chorehero-secrets.yaml

echo "✅ Local chorehero-secrets.yaml created at k8s/chorehero-secrets.yaml"
