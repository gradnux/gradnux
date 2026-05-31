# bootc stuff, i guess.
FROM scratch

COPY rootfs/* /

RUN ["/opt/tcc/bin/tcc", "/sbin/init.c", "-o", "/sbin/init"]

CMD ["/sbin/init"]