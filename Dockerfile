FROM umputun/reproxy:latest

COPY . /srv/site
EXPOSE 8080

ENTRYPOINT ["/srv/reproxy", "--assets.location=/srv/site", \
    "--assets.cache=720h", \
    "--assets.cache=text/html:168h", \
    "--assets.cache=image/png:8760h", \
    "--assets.cache=image/jpeg:8760h", \
    "--assets.cache=image/webp:8760h", \
    "--assets.cache=text/css:720h", \
    "--assets.cache=application/javascript:720h", \
    "--gzip"]