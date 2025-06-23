#!/bin/bash

# Exit on any error
set -e

# Optional: change this to version your images (e.g., v1, v2, etc.)
VERSION=latest

# Docker Hub username
USERNAME=justinmorgan21

# Image names
BACKEND_IMAGE=$USERNAME/chorehero-backend:$VERSION
FRONTEND_IMAGE=$USERNAME/chorehero-frontend:$VERSION

echo "🚀 Building Rails API image..."
docker build -t $BACKEND_IMAGE ./chorehero-api
echo "✅ Built $BACKEND_IMAGE"

echo "🚀 Building React frontend image..."
docker build -t $FRONTEND_IMAGE ./chorehero-frontend
echo "✅ Built $FRONTEND_IMAGE"

echo "📤 Pushing backend image..."
docker push $BACKEND_IMAGE

echo "📤 Pushing frontend image..."
docker push $FRONTEND_IMAGE

echo "🔄 Updating Kubernetes deployments..."
kubectl set image deployment/rails-api rails-api=$BACKEND_IMAGE
kubectl set image deployment/react-frontend react-frontend=$FRONTEND_IMAGE

echo "✅ Deployments updated!"

echo "🎉 All done! Images built, pushed, and deployed successfully!"
