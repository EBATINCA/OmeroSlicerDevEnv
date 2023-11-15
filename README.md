# Omero Slicer Development Environment
This repository holds a network of Docker containers with Omero.server, Omero.web and 3D Slicer with VNC connection.  Additionally, it includes a Postgres container necessary for the operation of omero.server.

## Installation

The 3D Slicer image is not available on DockerHub. It needs to be built locally. First, the repository image (https://github.com/OpenDx28/docker-vnc-base/tree/master) must be installed, and then the 3D Slicer image (https://github.com/OpenDx28/docker-slicer/blob/master) can be built.

## Deployment
