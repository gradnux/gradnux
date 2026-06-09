# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/usr/sbin:/usr/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN printenv

RUN tcc /sbin/init.c -o /sbin/init -Wl,-dynamic-linker=/lib/libc.so -L/lib

# RUN aria2c --verbose
# RUN aria2c -j 16 -x 16 -s 16 "https://http.cat/200.jpg" -o okay.jpg
# RUN hexdump -Cn32 okay.jpg

# RUN mv /sbin/initScript /sbin/init

CMD ["/sbin/init"]