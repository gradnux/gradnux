# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV LANG=en_US.UTF8 LC_ALL=en_US.UTF8

RUN env

RUN echo "int main() {while(1){}return 0;}" > /sbin/init.c
RUN tcc /sbin/init.c -o /sbin/init

# RUN ln -sT /bin/sh /sbin/init

# RUN aria2c --verbose
# RUN aria2c -j 16 -x 16 -s 16 "https://http.cat/200.jpg" -o okay.jpg
# RUN hexdump -Cn32 okay.jpg

# RUN mv /sbin/initScript /sbin/init

CMD ["/sbin/init"]