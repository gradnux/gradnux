# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

RUN ["/opt/bin/chibicc", "/sbin/init.c", "-o", "/sbin/init", "-I/opt/include"]

CMD ["/sbin/init"]