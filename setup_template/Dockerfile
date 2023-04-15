
#FROM	docs-docker-base
FROM	gcr.io/pixo-bootstrap/docs-docker-base:latest

ARG	CACHEBREAKER=https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h

WORKDIR	/build

COPY	. .

ADD	$CACHEBREAKER skipcache

#RUN	git submodule set-branch --branch main documentation/docs-pkgsite && \
#	git submodule update --init documentation/docs-pkgsite

# this sets PROJECT_URL, among other things
RUN	cat ./documentation/env.sh | grep -v git >> ~/.bashrc && \
	echo "export HOME=/root" >> ~/.bashrc && \
	chmod 777 /root && chmod 777 /root/.bashrc

ENV	PKGSITE_SOURCE /build/
ENV	PKGSITE_PORT 3001
ENV	PKGSITE_HOST localhost

RUN	. ~/.bashrc 2>/dev/null && \
	/documentation/docs-pkgsite/setup_nginx.sh "${PKGSITE_SOURCE}" "${PKGSITE_PORT}" "${PKGSITE_HOST}"

# move the documentation away, so the documentation doesn't document itself
RUN	mv /build/documentation /documentation/documentation

RUN	echo Go version: `go version`

ADD	$CACHEBREAKER skipcache

# We want to proxy from nginx, so we have to start both services, which is the job of start_services.sh
CMD	"/documentation/docs-pkgsite/start_services.sh" "${PKGSITE_SOURCE}" "${PKGSITE_PORT}" "${PKGSITE_HOST}"

