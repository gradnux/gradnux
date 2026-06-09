# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/usr/sbin:/usr/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN printenv

RUN tcc /sbin/init.c -o /sbin/init -Wl,-dynamic-linker=/opt/musl/lib/libc.so -L/opt/musl/lib

# RUN aria2c --verbose
# RUN aria2c -j 16 -x 16 -s 16 "https://http.cat/100.jpg" -o continue.jpg
# RUN hexdump -n32 continue.jpg

# RUN mv /sbin/initScript /sbin/init

CMD ["/sbin/init"]