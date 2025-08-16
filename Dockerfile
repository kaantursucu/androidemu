FROM ghcr.io/hassio-addons/base:14.2

RUN apk add --no-cache \
    qemu-system-x86_64 \
    qemu-img \
    x11vnc \
    xvfb \
    novnc \
    fluxbox \
    curl

WORKDIR /data

# Android image indir (ilk kurulumda)
RUN curl -L -o android-x86.iso https://sourceforge.net/projects/android-x86/files/Release%209.0/android-x86_64-9.0-r2.iso/download

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
