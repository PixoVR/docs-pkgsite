
FROM	docs-docker-base as builder

WORKDIR	/build

COPY	. .

#RUN	pkgsite --version	#doesn't produce a version, but confirms installation

#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD	["/build/documentation/start_pkgsite.sh", "/build/", "3000", "localhost"]
