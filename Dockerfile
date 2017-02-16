# Base off the Docker container that includes Alpine for installing packages.
FROM ntc-registry.githost.io/nextthingco/chiptainer_alpine

# Set the hostname for our device
ARG HOSTNAME="octoprint"

# Install tools needed to download and build the CHIP_IO library from source.
RUN apk update && \
	apk add avahi && \
	apk add python-dev && \
	apk add py-setuptools && \
	apk add py2-pip && \
	apk add py2-yaml && \
	apk add g++ && \
	apk add gcc && \
	apk add make && \
	apk add linux-headers && \
	apk add git && \

	pip install --upgrade pip && \
	pip install virtualenv && \

	# Download Octoprint source code, build, and install.
	git clone --depth 1 https://github.com/foosel/OctoPrint.git && \
	cd OctoPrint && \
	virtualenv venv && \
	./venv/bin/pip install pip --upgrade && \
	./venv/bin/python setup.py install && \
	mkdir /.octoprint && \

	# Change device hostname so it can be accessed as octoprint.local on your network
	echo $HOSTNAME > /etc/hostname && \
	printf "127.0.0.1       localhost\n127.0.1.1       $HOSTNAME" > /etc/hosts && \

	apk del py2-pip && \
	apk del g++ && \
	apk del gcc && \
	apk del make && \
	apk del py2-yaml && \
	apk del linux-headers && \
	apk del git

