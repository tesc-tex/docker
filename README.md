# docker

Use this script in project directory to build (or rebuild) `.pdf`.
It assumes that `build.sh` exists in project's root.

```sh
#!/usr/bin/env sh

name=$(basename $(pwd))
container=$(docker ps -a --filter "name=$name" --latest | tail -n +2)

if [[ -z "$container" ]]; then
  echo "Starting new container: $name"
  docker run \
    --name "$name" \
    --volume $(pwd):/data \
    isagila/latex:latest \
    sh -c "./build.sh"
else
  echo "Found container: $name"
  docker start -i "$name"
fi
```
