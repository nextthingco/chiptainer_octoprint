# CHIPtainer Example: OctoPrint

This is a Docker file for building a container that starts an OctoPrint web server so that you can control your 3D printer through a web browser!

To get started, log into the Docker NTC account:

```
docker login ntc-registry.githost.io
```

Then download the latest image:

```
docker pull ntc-registry.githost.io/nextthingco/chiptainer_octoprint:master
```

Now run the Docker container, allowing access to the board's network capabilities:

```
docker run --name octoprint --privileged --net=host -it ntc-registry.githost.io/nextthingco/chiptainer_octoprint:master
```

You should now be able to log into Octoprint by going to http://octoprint.local in your web browser on the same network as your board.