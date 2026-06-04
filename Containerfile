# containers stuff, i guess.
FROM scratch

COPY rootfs/ /

ENV PATH="/opt/tcc:/opt/tcc/lib:/opt/tcc/lib/tcc:/opt/bin:/sbin:/bin:${PATH}"
# for literally anything (i guess) to work properly

RUN ["tcc", "/sbin/init.c", "-o", "/sbin/init", "-L/opt/lib", "-I/opt/tcc/lib/tcc/include", "-D__DEFINED_va_list", "-D__isoc_va_list=va_list", "-D__DEFINED___isoc_va_list"]

CMD ["/sbin/init"]