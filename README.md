# dev-machine

- ubuntu 22.04
- dev machine version `0.1.0`

## build

```bash
docker build -t ghcr.io/falcon-infra/dev .
```

## test

```bash
docker run -it --rm -v `pwd`/..:/root/code ghcr.io/falcon-infra/dev /bin/zsh
```

## deploy

```
docker tag ghcr.io/falcon-infra/dev ghcr.io/falcon-infra/dev:0.1.0
docker push ghcr.io/falcon-infra/dev:0.1.0
```

## run

```bash
docker run --privileged -d -it --name angel -v `pwd`:/root/code -w /root/code ghcr.io/falcon-infra/dev:0.1.0
docker exec -it --detach-keys="ctrl-z,z" angel /bin/zsh
git config --global user.name $your_name
git config --global user.email $your_email
```
