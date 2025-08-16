# dev-machine

- ubuntu 22.04
- dev machine version `0.1.0`

## use Buildx
   ```bash
   docker buildx create --use
   ```

## build and deploy

linux/amd64
```bash
docker buildx build --platform linux/amd64 \
    -t ghcr.io/falcon-infra/dev:latest \
    -t ghcr.io/falcon-infra/dev:v0.1.0 \
    . --push
```

linux/arm64
```bash
docker buildx build --platform linux/arm64 \
    -t ghcr.io/falcon-infra/dev:latest \
    -t ghcr.io/falcon-infra/dev:v0.1.0 \
    . --push
```

## test

```bash
docker run -it --rm -v `pwd`/..:/root/code ghcr.io/falcon-infra/dev /bin/zsh
```

## run

```bash
docker run --privileged -d -it --name angel -v `pwd`:/root/code -w /root/code ghcr.io/falcon-infra/dev:0.1.0
docker exec -it --detach-keys="ctrl-z,z" angel /bin/zsh
git config --global user.name $your_name
git config --global user.email $your_email
```
