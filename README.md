## Simple Dockerfile for development

### Usage

This is best used from eg. a docker-compose file. For easiest use, you'll
just need a volume mounted to `/src/` containing your ext application.
When run, `sencha app watch` will be invoked in that folder.
