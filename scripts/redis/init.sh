#!/bin/bash

sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt-get -qq update
sudo apt-get install -y redis-server
