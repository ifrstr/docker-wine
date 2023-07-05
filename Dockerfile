# syntax=docker/dockerfile:1

FROM ifrstr/novnc:0.0.2

ENV WINEARCH=win64 \
  WINEPREFIX=/wine

COPY --chmod=0755 rootfs /

RUN apt update && \
  apt install -y \
  ca-certificates \
  wget && \
  # Add Wine sources
  dpkg --add-architecture i386 && \
  mkdir -pm755 /etc/apt/keyrings && \
  wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
  wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources && \
  \
  # Install packages
  apt update && \
  apt install -y \
  winehq-stable && \
  \
  # Winetricks
  wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
  chmod +x /usr/bin/winetricks && \
  \
  # wineboot
  /usr/bin/wine wineboot && \
  /usr/bin/winetricks win7 && \
  # Cleanup
  apt purge -y wget && \
  apt autoremove -y && \
  apt clean && \
  rm -rf \
  /var/lib/apt/lists/* \
  /tmp/* \
  /var/tmp/*
