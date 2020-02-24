FROM python:alpine

ARG BUILD_DATE
ARG VERSION
LABEL build_version="RadPenguin version:- ${VERSION} Build-date:- ${BUILD_DATE}"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL C.UTF-8

WORKDIR /app

RUN apk add --no-cache \
  bash \
  ffmpeg \
  rtmpdump \
  mplayer \
  mpv

RUN pip install --no-cache-dir youtube_dl

RUN rm -rf \
  /opt/* \
  /tmp/* \
  /var/cache/*

ENTRYPOINT ["/usr/local/bin/youtube-dl"]
