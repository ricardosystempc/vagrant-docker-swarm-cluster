#!/bin/bash

apt-get update
apt-get install -y docker.io
systemctl enable --now docker