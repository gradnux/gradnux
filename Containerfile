# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV LANG=en_US.UTF8 LC_ALL=en_US.UTF8

RUN env

# RUN echo "int main() {while(1){}return 0;}" > /sbin/init.c
# RUN tcc /sbin/init.c -o /sbin/init

RUN cp -r sbin/. bin && rm -rf sbin && ln -sT ../bin /sbin
# for /sbin/init

RUN cd /tmp && mkdir -p make && tar -xf make.tar.gz -C make --strip-components 1 && cd make && CC=tcc LD=tcc ./configure --host=x86_64-unknown-linux-musl --build=x86_64-unknown-linux-musl && ./build.sh && ./make install && cd .. && rm -rf make make.tar.gz

RUN cd /tmp && mkdir -p gcc && tar -xf gcc.tar.gz -C gcc --strip-components 1 && cd gcc && contrib/download_prerequisites --no-verify && CC=tcc ./configure --disable-multilib && make all install && cd .. && rm -rf gcc gcc.tar.gz && \
	rm -rf /bin/tcc /lib/tcc

# tcc headers might be useful, so idk

RUN cd /tmp/scavenge && ./build.sh && cp scavenge /bin/ && cd .. && rm -rf scavenge

# RUN aria2c --verbose
# RUN aria2c -j 16 -x 16 -s 16 "https://http.cat/200.jpg" -o okay.jpg
# RUN hexdump -Cn32 okay.jpg

# RUN mv /sbin/initScript /sbin/init

CMD ["/sbin/init"]