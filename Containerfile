# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/bin:/sbin:/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN ["/opt/bin/tcc", "/sbin/init.c", "-o", "/sbin/init", "-I/opt/include", "-L/usr/lib", "-B/opt/tcc/lib/tcc", "-lc"]

CMD ["/sbin/init"]