# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

RUN chibicc /sbin/init.c -o /sbin/init -I/opt/include

CMD ["/sbin/init"]