# parsec

Parsec in a docker container. To install docker read the [documentation](https://docs.docker.com/engine/)

## Benefits

* Easily removable and versioned
* Works on ALL linux distros that can run Docker (even Gentoo)
* Sandboxed (remote connects to X and Pulseaudio)

## Install

```bash
git clone https://github.com/L-Briand/docker-parsec
cd docker-parsec
docker build -t orandja/parsec:latest .
```

## Run

Launch `./parsec`
