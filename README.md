# Docker development environment for Jobbar

[Jobbar](https://github.com/ut-connewitz/jobbar-dev-env) is a job scheduling app, specified to organize tasks for events.

## This docker environment contains

- Laravel
- MariaDB (MySQL)
- PHPMyAdmin (optional)

## How to install

Clone this repo to your project folder and the [Jobbar](https://github.com/ut-connewitz/jobbar-dev-env) repo on the same level.

Your folder structure should be:

```
- project
    - jobbar-app
    - jobbar-dev-env
```

## How to start

Build and start the development environment with

```
docker-compose up
```

The jobbar should accessible at `http://localhost:8080`

## Architecture

[Architecture](./architecture.png)


## Configuration