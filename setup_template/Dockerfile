
FROM	docs-docker-base as builder

WORKDIR	/build

COPY	. .

#RUN	pkgsite --version	#doesn't produce a version, but confirms installation

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD	["/build/documentation/docs-pkgsite/start_pkgsite.sh", "/build/", "3000", "0.0.0.0"]

