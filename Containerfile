# bootc stuff, i guess.
FROM scratch

COPY rootfs/* /

RUN ["/opt/bin/chibicc", "/sbin/init.c", "-o", "/sbin/init"]

CMD ["/sbin/init"]