# Omero Slicer Development Environment
This repository holds a network of Docker containers with Omero.server, Omero.web and 3D Slicer with VNC connection.  Additionally, it includes a Postgres container necessary for the operation of omero.server. This docker-compose.yml is a extension of https://github.com/ome/docker-example-omero/tree/master.

Additionally, you can add the Omero.3D Slicer plugin and the 3D Slicer OmeroConnection extension.

## Installation

The 3D Slicer image is not available on DockerHub. It needs to be built locally. First, download the repository (https://github.com/OpenDx28/docker-vnc-base/tree/master) and build the image:

```bash
cd src
docker build -t vnc-base .
```

Then, download the repository and build the 3D Slicer image (https://github.com/OpenDx28/docker-slicer/blob/master) with version 5.6.0:

```bash
cd src
docker build -t slicer --build-arg BASE_IMAGE="vnc-base:latest" --build-arg SLICER_VERSION="5.6.0" --build-arg SLICER_DOWNLOAD_URL="https://download.slicer.org/bitstream/65632f836865868506020c48" .
```

Download Dockerfile and build the 3D Slicer image with OmeroConnection extension (https://github.com/EBATINCA/SlicerOmero):

```bash
docker build -t slicer_omero_extension .
```

## Deployment

Download docker-compose.yml and change the directories of the volumes. In the docker-compose.yml directory:

```bash
docker compose up -d
```

## Components

Docker containers:

- slicer_docker: Docker container for 3D Slicer 5.6.0 with OmeroConnection extension
- postgres_docker: Docker container for PostgresSQL
- omeroserver_docker: Docker container for Omero.server
- omeroweb_docker: Docker container for Omero.web

Docker networks:

- network: Docker network for the four containers

Docker volumes:

- slicer_volume: Volume for 3D Slicer for images, extensions and IDs of the Omero.web images. This volume is also in omeroweb_docker. 
- slicer_ini_volume: Volume for the 3D Slicer configuration. Install Slicer-32390.ini here.
- postgresql_volume: Volume for PostgresSQL
- omero_server_volume: Volume for Omero.server
- omero_web_conf_volume: Volume for configuration for Omero.web. Install the Omero.3D Slicer config.omero file (https://github.com/EBATINCA/OmeroSlicerConf) here. 
- omero_web_extension_volume: Volume for extensions for Omero.web. Install the Omero.3D Slicer plugin (https://github.com/EBATINCA/OmeroSlicer) here.

Important ports:

- http://localhost:6901 : To access 3D Slicer locally through VNC
- http://localhost:8085 : To access directories of the slicer_docker
- http://localhost:4064 : To access Omero.server. You can access with Omero.insight or Omero.web. **Username**: `root` **Password**: `omero`
- http://localhost:4080 : To access Omero.web connected to Omero.server of the omeroserver_docker. Use **Username** and **Password** of the Omero.server


## Undeployment

To stop the containers:

```bash
docker stop slicer_docker omeroserver_docker postgres_docker omeroweb_docker
```

To delete the containers:

```bash
docker container rm slicer_docker omeroserver_docker postgres_docker omeroweb_docker 
```

To delete the noetwork:

```bash
docker network rm network
```
