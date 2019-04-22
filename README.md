# Poeschl IoT hosts 
[![Travis (.org)](https://img.shields.io/travis/Poeschl/IoT-hosts.svg)](https://travis-ci.org/Poeschl/IoT-hosts)

This repository generates a hosts file for the addresses of my running IoT devices.
It use it as a fallback on my [Pi-hole](https://pi-hole.net/) in case a custom firmware misses on of it.

The generated `hosts` can be found in the [`dist`](https://github.com/Poeschl/IoT-hosts/tree/dist) branch or as raw under `https://raw.githubusercontent.com/Poeschl/IoT-hosts/dist/hosts`.

## Update

The hosts file gets updated every month automatically.
To do it manually clone the repository and execute `update.sh`.
It will create a `dist` folder with the `hosts` inside.
