# dev-machine

- ubuntu 22.04
- dev machine version `0.1.0`

## use Buildx
   ```bash
   docker buildx create --use
   ```

## build and deploy

```bash
docker buildx build --platform linux/amd64,linux/arm64 \
    -t ghcr.io/falcon-infra/dev:latest \
    -t ghcr.io/falcon-infra/dev:v0.1.0 \
    . --push
```

ubuntu22.04
```bash
docker buildx build --platform linux/amd64,linux/arm64 \
    -t ghcr.io/falcon-infra/dev:v0.1.0-ubuntu22.04 \
    -t ghcr.io/falcon-infra/dev:ubuntu22.04 \
    -t ghcr.io/falcon-infra/dev:latest \  # Only after testing!
    -f ubuntu22.04-dockerfile \
    . --push
```
ubuntu24.04
   ```bash
docker buildx build --platform linux/amd64,linux/arm64 \
    -t ghcr.io/falcon-infra/dev:v0.2.0-ubuntu24.04 \
    -t ghcr.io/falcon-infra/dev:ubuntu24.04 \
    -f ubuntu24.04-dockerfile \
    . --push
   ```

## test

```bash
docker run -it --rm -v `pwd`/..:/root/code ghcr.io/falcon-infra/dev /bin/zsh
```

## run

```bash
docker run --privileged -d -it --name angel -v `pwd`:/root/code -w /root/code ghcr.io/falcon-infra/dev:ubuntu24.04
docker exec -it --detach-keys="ctrl-z,z" angel /bin/zsh
git config --global user.name $your_name
git config --global user.email $your_email
```
