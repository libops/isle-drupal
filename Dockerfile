# syntax=docker/dockerfile:1.12.1@sha256:93bfd3b68c109427185cd78b4779fc82b484b0b7618e36d0f104d4d801e66d25
ARG TAG=main
FROM islandora/drupal:${TAG}

COPY --link rootfs /
