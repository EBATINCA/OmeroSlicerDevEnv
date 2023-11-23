# Omero Slicer Development Environment
This repository holds a network of Docker containers with Omero.server, Omero.web and 3D Slicer with VNC connection.  Additionally, it includes a Postgres container necessary for the operation of omero.server. This docker-compose.yml is a extension of https://github.com/ome/docker-example-omero/tree/master.

## Installation

The 3D Slicer image is not available on DockerHub. It needs to be built locally. First, the repository image (https://github.com/OpenDx28/docker-vnc-base/tree/master) must be installed, and then the 3D Slicer image (https://github.com/OpenDx28/docker-slicer/blob/master) can be built.

## Deployment

Download docker-compose.yml and change the directories of the volumes. In the docker-compose.yml directory:

```bash
docker compose up -d
```

## Components

Docker containers:

- slicer_docker: Docker container for 3D Slicer
- postgres_docker: Docker container for PostgresSQL
- omeroserver_docker: Docker container for Omero.server
- omeroweb_docker: Docker container for Omero.web

Docker networks:

- network: Docker network for the four containers

Docker volumes:

- slicer_volume: Volume for 3D Slicer for images, extensions and IDs of the Omero.web images. This volume is also in omeroweb_docker.
- postgresql_volume: Volume for PostgresSQL
- omero_server_volume: Volume for Omero.server
- omero_web_conf_volume: Volume for configuration for Omero.web
- omero_web_extension_volume: Volume for extensions for Omero.web

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
