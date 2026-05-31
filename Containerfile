# bootc stuff, i guess.
FROM scratch

COPY rootfs/* /

RUN tcc /sbin/init.c -o /sbin/init

CMD ["/sbin/init"]