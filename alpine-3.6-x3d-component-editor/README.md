# Docker image for X3d editor : component editor

https://github.com/x3dom/component-editor

## Build

docker build -t pamtrak06/x3d-component-editor    --file build/Dockerfile build

## Usage 

docker run -dt --name x3d-component-editor_1  --publish=80:80 pamtrak06/x3d-component-editor

Open http://localhost/component_editor/

