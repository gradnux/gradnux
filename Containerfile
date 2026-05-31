# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

RUN ["/opt/bin/musl-gcc", "/sbin/init.c", "-o", "/sbin/init"]

CMD ["/sbin/init"]