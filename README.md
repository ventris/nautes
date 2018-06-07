nautes
=======

Container to help administer Kubernetes from within a container in pipelines.

Currently nautes have support for kubectl, istioctl and helm.


Included binaries and their versions

| Binary  | Version |
| ------- | ------- |
|istioctl | 0.8.0   |
|helm     | 2.9.1   |
|kubectl  | 1.10.4  | 


### Usage

Call on this container from a build pipeline with these ENV variables

| variable   | description              |
| ---------- | ------------------------ |
| CLUSTER    | name of the cluster      |
| CLUSTER_CA | CA for the cluster       |
| SERVER     | URL of the api server    |
| USER       | username to connect with |
| USER_CERT  | auth cert for the user   |
| USER_KEY   | auth key for the user    |


#### Example

Example on how to use this container in a pipeline

**.gitlab-ci.yaml**
```yaml
k8s-deploy:
  image: nautes
  stage: deploy
  script:
  - kubectl create namespace hej
```

### Build

Run from the root of the folder
```
/bin/sh download-binaries.sh
docker build --tag nautes .
```

Due to the size of the binaries everything in the bin directory is excluded
in gitignore.
You will have to run this script after you have cloned the repo.


**Building behind a proxy requires following addresses to be whitelisted:**
* storage.googleapis.com
* github.com
* hub.docker.com
