# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

# create /tmp/ because chibicc wants that apparently
RUN ["/bin/mkdir", "-p", "/tmp"]
RUN ["/bin/chmod", "1777", "/tmp"]

RUN ["/opt/bin/chibicc", "/sbin/init.c", "-o", "/sbin/init"]

CMD ["/sbin/init"]