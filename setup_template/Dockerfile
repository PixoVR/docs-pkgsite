
#FROM	docs-docker-base
FROM	gcr.io/pixo-bootstrap/docs-docker-base:latest

ARG	CACHEBREAKER=https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h

WORKDIR	/build

COPY	. .

#RUN	pkgsite --version	#doesn't produce a version, but confirms installation

RUN	git submodule set-branch --branch main documentation/docs-pkgsite && \
	git submodule update --init documentation/docs-pkgsite

ADD	$CACHEBREAKER skipcache

# set up nginx with the proxy setup
RUN	cp /build/documentation/docs-pkgsite/nginx.conf /etc/nginx/nginx.conf

# move the documentation away, so the documentation doesn't document itself
RUN	mv /build/documentation /documentation/documentation 

# The second is port for pkgsite to listen on.  We want nginx to proxy to this port, so we don't need to expose it to outside.
# The third parameter here is the host. An empty string allows for all hosts, but we want localhost because it's only talking to nginx.
#CMD	["/documentation/documentation/docs-pkgsite/start_pkgsite.sh", "/build/", "3001",""]

# We want to proxy from nginx, so we have to start both services.
CMD	["/documentation/documentation/docs-pkgsite/start_services.sh", "/build/", "3001"]

