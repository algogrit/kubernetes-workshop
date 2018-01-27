#!/usr/bin/env bash

gcloud auth login

gcloud container clusters get-credentials kube-101 --zone asia-south1-b --project learning-kubernetes-g

cat ~/.kube/config # Can be changed via env variables

# Nodes

kubectl get nodes -o wide

kubectl describe node gke-kube-101-default-pool-005d05e4-4q2n # Provides debugging information

# Events

kubectl get events

# Namespaces

kubectl create ns workshop

kubectl get ns

# Context

kubectl config get-contexts

kubectl config set-context workshop --cluster gke_learning-kubernetes-g_asia-south1-b_kube-101 --user gke_learning-kubernetes-g_asia-south1-b_kube-101 --namespace workshop

kubectl config use-context workshop

# Pods

kubectl get pods

## Setting up Redis

  # Deploying and managing pods

  kubectl apply -f redis-primary.deployment.yml

  kubectl delete pods redis-primary-2517341871-tm24m

  kubectl get deployments

  kubectl describe deployments

  kubectl delete deployment redis-primary

  kubectl describe pod redis-primary-2517341871-n89zb

  # Setting up replica

  kubectl apply -f redis-replica.deployment.yml

  # Services

  kubectl apply -f redis-primary.service.yml

  kubectl apply -f redis-replica.service.yml

  kubectl get services

  # Shell access into a pod

  kubectl exec -it redis-replica-3847377366-t8bxs -- /bin/bash

## Setting up App

  # Deploying pods

  kubectl apply -f app.secret.yml

  kubectl apply -f app.configmap.yml

  kubectl apply -f app.deployment.yml

  kubectl delete deployment webapp

  kubectl get pods --watch

  # Applying services

  kubectl apply -f app.service.yml

  kubectl get services

  # Accessing Logs

  kubectl logs -f webapp-2318222892-rk3pg

  # Auto Scaling

  kubectl apply -f app.horizontal_pod_autoscaler.yml

  kubectl get hpa --watch

  kubectl edit hpa

  kubectl describe secret webapp
  kubectl describe configmap webapp
  kubectl describe hpa webapp
