#!/usr/bin/env bash

minikube start --memory=4096 --bootstrapper=kubeadm
eval $(minikube docker-env)
helm repo add projectriff https://riff-charts.storage.googleapis.com
helm repo update

kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
