# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/bin:/sbin:/bin:${PATH}" # for chibicc to work properly
RUN ["/opt/bin/chibicc", "/sbin/init.c", "-o", "/sbin/init", "-I/opt/include"]

CMD ["/sbin/init"]