# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/tcc:/opt/tcc/lib/tcc:/opt/bin:/sbin:/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN ["tcc", "/sbin/init.c", "-o", "/sbin/init"]

CMD ["/sbin/init"]