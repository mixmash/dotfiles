#!/bin/env bash

sudo apt-get purge $(dpkg -l | grep '^rc' | awk '{print $2}')