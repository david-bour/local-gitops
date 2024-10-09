#!/bin/bash

k3d cluster create gotham \
	-p "80:80@loadbalancer" \
	-p "443:443@loadbalancer" \
	--servers 1 \
	--volume $PWD/storage/k3d:/var/storage
