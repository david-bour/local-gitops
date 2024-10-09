#!/bin/bash
kubectl run -it alpine --image alpine --rm --overrides='
  {"spec": { "containers": [{
    "name": "alpine", "image": "alpine",
    "args": [ "sh" ],
    "stdin": true, "stdinOnce": true, "tty": true,
    "volumeMounts": [ { "mountPath": "/mnt/storage", "name": "my-volume" }]
  }],
    "volumes": [ {
        "name": "my-volume",
        "persistentVolumeClaim": { "claimName": "my-pvc" }
    }]}
  }'
