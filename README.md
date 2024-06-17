# GraalVM Docker Images for Pterodactyl
This repository is a fork of [RikoDEV's GraalVM Docker Images](https://github.com/RikoDEV/pterodactyl-graalvm), but supports more up-to-date JDK versions and built-in [mimalloc](https://github.com/microsoft/mimalloc) support.

# Supported environments
Supports `amd64` (64-bit x86) and `arm64` (64-bit ARM) on Linux.

## Predefined startup flags

Could be added to startup, after `java` and before `-jar`, by using notation `{{ENV_VARIABLE_NAME}}`. These startup flags also considered environment variables.

Currently, predefined flags list are:

- `AIKAR_FLAGS`
- `GRAALVM_EE_FLAGS`

## Predefined Docker pull list for egg

I've generated a convention list in `eggtags.sh`, which you could put into egg Docker image list