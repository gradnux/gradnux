# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/tcc:/opt/tcc/lib:/opt/tcc/lib/tcc:/opt/bin:/sbin:/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN printenv

RUN tcc /sbin/init.c -o /sbin/init -Wl,-dynamic-linker=/opt/musl/lib/libc.so -L/opt/musl/lib

# RUN mv /sbin/initScript /sbin/init

CMD ["/sbin/init"]