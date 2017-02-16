# Base off the Docker container that includes Alpine for installing packages.
FROM ntc-registry.githost.io/nextthingco/chiptainer_alpine

# Install tools needed to download and build the CHIP_IO library from source.
RUN apk update &&
	apk add python-dev && \
	apk add py-setuptools && \
	apk add py2-pip && \
	apk add py2-yaml && \
	apk add g++ && \
	apk add gcc && \
	apk add make && \
	apk add git && \

	pip install virtualenv && \

	git clone --depth 1 https://github.com/foosel/OctoPrint.git && \
	cd OctoPrint && \
	virtualenv venv && \
	./venv/bin/pip install pip --upgrade && \
	./venv/bin/python setup.py install && \
	mkdir /.octoprint

ENTRYPOINT /usr/local/src/venv/bin/octoprint --iknowwhatimdoing --host 0.0.0.0 --port 80 --basedir /data/octoprint
