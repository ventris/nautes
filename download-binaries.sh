#!/bin/bash

# Versions
ISTIO_VERSION="0.8.0"
HELM_VERSION="2.9.1"
KUBECTL_VERSION="1.10.4"


HELM="helm-v${HELM_VERSION}-linux-amd64"
ISTIO="istio-${ISTIO_VERSION}"

# Kubectl
printf "\nDownloading kubectl binary...\n"
curl -Lo bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/darwin/amd64/kubectl
chmod +x bin/kubectl
printf "\nDone...\n\n"

# Istio
printf "\nDownloading istioctl binary...\n"
curl -LO https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/${ISTIO}-linux.tar.gz
tar -zxf ${ISTIO}-linux.tar.gz
cp ${ISTIO}/bin/istioctl bin/istoctl
rm -r ${ISTIO}-linux.tar.gz ${ISTIO}
printf "\nDone...\n\n"

# helm
printf "\nDownloading helm binary...\n"
curl -LO https://storage.googleapis.com/kubernetes-helm/${HELM}.tar.gz 
tar -zxf ${HELM}.tar.gz
cp linux-amd64/helm bin/helm
rm -r linux-amd64 ${HELM}.tar.gz
printf "\nDone...\n"
