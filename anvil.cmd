:: A simple batch file to run smith in a dockerized environment (and to ease the transition from Vagrant)
:: Copyright (c) 2022 SIL International (http://www.sil.org)'
:: Released under the MIT License (http://en.wikipedia.org/wiki/MIT_License)
:: maintained by Nicolas Spalinger
@echo off  
title: anvil: helper for running a dockerized smith 

set HOME=%USERPROFILE%
set COMPOSE="%USERPROFILE%\repos\anvil\docker-compose.yml"

if "%1" == "" (
    echo Anvil: # # helper for running a dockerized smith
    echo Config file %COMPOSE%
    echo Usage: expected a parameter like:
    echo   anvil up
    echo   anvil ssh
    echo   anvil status
    echo   anvil down
) else if "%1" == "config" (
    echo Validating configuration
    docker compose -f %COMPOSE% config
) else if "%1" == "up" (
    echo Getting image, spinning up the container and provisionning
    docker compose -f %COMPOSE% -p smith build --pull
    docker compose -f %COMPOSE% up -d --remove-orphans 
) else if "%1" == "provision" (
    echo No need to use provision any longer, use up instead
) else if "%1" == "status" (
    echo Showing container status
    docker compose -f %COMPOSE% ps
) else if "%1" == "ssh" (
    echo Entering the container in interactive mode type, exit to get back
    docker compose -f %COMPOSE% exec smith bash
) else if "%1" == "when" (
    echo ID              Creation date                   Status
    docker container ls --format '{{.ID}}\t{{.CreatedAt}}\t{{.State}}\t{{.Status}}'
) else if "%1" == "down" (
    echo Stopping and removing the container
    docker compose -f %COMPOSE% down
) else if "%1" == "clean" (
    echo Purging stale images containers and the whole build cache
    docker stop smith
    docker rmi -f smith 
    docker system prune -a
)
