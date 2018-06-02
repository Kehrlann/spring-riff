#!/usr/bin/env bash

export NODE_PORT=$(kubectl get --namespace riff-system -o jsonpath="{.spec.ports[0].nodePort}" services projectriff-riff-http-gateway)
export NODE_IP=$(kubectl get nodes --namespace riff-system -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
