## Simple Dockerfile for development

### Usage

This is best used from eg. a docker-compose file. For easiest use, you'll
just need a volume mounted to `/src/` containing your ext application.
When run, `sencha app watch` will be invoked in that folder.

### Build for different Sencha CMD versions

Per default the image offers Sencha CMD in version 7.2.0.56. In order to have an
image with a different version you could use the `--build-arg` option while using `docker build`:

```
docker build -t sencha-cmd-docker:6.5.3.6 --build-arg SENCHA_CMD_VERSION_FULL=6.5.3.6 .
```
