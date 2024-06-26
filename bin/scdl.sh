#!/bin/sh

echo Running docker build of scdl first...
docker build --tag scdl - <<EOF
FROM alpine AS unzipper
WORKDIR /zip
RUN wget 'https://github.com/flyingrub/scdl/archive/refs/tags/v2.7.1.zip' && \
    unzip 'v2.7.1.zip' && mv scdl-2.7.1 scdl

FROM python:alpine AS scdl
WORKDIR /scdl
COPY --from=unzipper /zip/scdl ./scdl
RUN pip install ./scdl && apk add --no-cache ffmpeg
ENTRYPOINT ["scdl"]
CMD ["--help"]
EOF

echo Running dockerized scdl...
docker run -it --volume "$PWD:/scdl" scdl "$@"
