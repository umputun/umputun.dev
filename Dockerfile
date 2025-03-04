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
    "--gzip", \
    "--header=Content-Security-Policy:default-src 'self'; script-src 'self' 'unsafe-inline' https://analytics.umputun.com; style-src 'self' 'unsafe-inline'; img-src 'self' data:; connect-src 'self' https://analytics.umputun.com; upgrade-insecure-requests", \
    "--header=Strict-Transport-Security:max-age=31536000; includeSubDomains; preload", \
    "--header=X-Frame-Options:DENY", \
    "--header=X-Content-Type-Options:nosniff", \
    "--header=Referrer-Policy:strict-origin-when-cross-origin", \
    "--header=Permissions-Policy:camera=(), microphone=(), geolocation=()", \
    "--header=Cross-Origin-Opener-Policy:same-origin"]