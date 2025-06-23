#!/bin/bash

# Fail fast on any error
set -e

echo "🚀 Building Rails API image..."
docker build -t justinmorgan21/chorehero-backend ./chorehero-api

echo "✅ Built chorehero-backend"

echo "🚀 Building React frontend image..."
docker build -t justinmorgan21/chorehero-frontend ./chorehero-frontend

echo "✅ Built chorehero-frontend"

echo "📤 Pushing backend to Docker Hub..."
docker push justinmorgan21/chorehero-backend

echo "📤 Pushing frontend to Docker Hub..."
docker push justinmorgan21/chorehero-frontend

echo "🎉 All images built and pushed successfully!"

