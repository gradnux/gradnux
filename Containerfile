# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/tcc/lib/tcc:/opt/bin:/sbin:/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN ["/opt/bin/tcc", "/sbin/init.c", "-o", "/sbin/init", "-I/opt/include", "-B/opt/tcc/lib/tcc", "-L/opt/tcc/lib/tcc"]

CMD ["/sbin/init"]