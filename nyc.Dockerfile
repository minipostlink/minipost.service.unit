FROM base/archlinux
CMD /usr/sbin/nginx -c /minipost.nginx.conf
EXPOSE 80
EXPOSE 443
MAINTAINER undefined

RUN pacman --refresh --refresh --sync --sysupgrade --noconfirm
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN rm /etc/locale.gen.pacnew

RUN pacman --sync nginx --noconfirm
ADD nyc.minipost.link.secret.key /minipost.secret.key
ADD nyc.minipost.link.crt /minipost.crt
ADD nyc.nginx.conf /minipost.nginx.conf
