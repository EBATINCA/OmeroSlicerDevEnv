# Omero Slicer Development Environment
Development environment for communication extensions between 3DSlicer and Omero 

cd src
docker build -t slicer --build-arg BASE_IMAGE="vnc-base:latest" .
