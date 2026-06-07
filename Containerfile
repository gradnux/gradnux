# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/tcc:/opt/tcc/lib:/opt/tcc/lib/tcc:/opt/bin:/sbin:/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN printenv

# RUN ["tcc", "/sbin/init.c", "-o", "/sbin/init", "-nostdinc", "-isystem /opt/tcc/lib/tcc/include"]

RUN mv /sbin/initScript /sbin/init


CMD ["/sbin/init"]