# Drupal

Base docker image for Islandora sites running on the LibOps platform. Used in [the LibOps starter site](https://github.com/LibOps/islandora-starter-site). All LibOps Islandora sites are based on that repo.

## Dependencies

This docker image requires [islandora/drupal] to build.

Additional config files, found in [rootfs](./rootfs), are then added to that image.

[/etc/s6-overlay](./rootfs/etc/s6-overlay) came from [islandora-devops/isle-site-template](https://github.com/Islandora-Devops/isle-site-template/tree/main/drupal/rootfs/etc/s6-overlay) and is built here to avoid maintaining this functionality across sites running on the LibOps platform.

Additional config files were modified from either [Islandora-Devops/isle-buildkit](https://github.com/islandora-devops/isle-buildkit) [Islandora-Devops/isle-site-template](https://github.com/islandora-devops/isle-site-template), or made from scratch.

## Building/tagging

This repo follows the same semver tagging schema as [islandora/drupal]. [islandora/drupal] images are found using [a bash script](./ci/find-tags.sh). Those tags are then used to create separate images for each isle-buildkit tag.

[islandora/drupal](https://github.com/Islandora-Devops/isle-buildkit/tree/main/drupal)
