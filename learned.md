What we learned and minor issues we ran into
*This is still experimental code after all*

## Cool stuff
1. Creating a service is easy
1. Rolling upgrade built in - need to update the service to support it or create it with the setting initially
1. Handles service failures, node failures seamlessly
1. Services scale up and down with a simple command (change to replica count not +- *number*)
1. Digital hosting is pretty slick

## Minor issues
1. Couldn't run birthday party example w/o several changes (volumes, networks, links)
1. DigitalOcean default droplets 1.11 requiring installation by hand
1. Stacks and DAB files are still experimental in 1.12.  On Mac (propably Windows) experimental features are turned on.  On ubuntu, you have to pull the source and rebuild docker with experimental features turned on. [Expermental features](https://github.com/docker/docker/tree/master/experimental)
1. Creating DAB file removes top level networks but not the networks defined for each service (container)
1. If using links and the environment variables it creates, then your services won't be able to communicate.  See [12 factor app paterns](https:/12factor.net)
1. Volumes have the same issue
1. Ingress netork routing was using round robin and including nodes not running our service
1. When creating a DAB, docker-compose file needs image attribute it can't just have build command
1. When pulling images from dockerhub we received a 403 "repository locked" message.  We changed the image to be private then back to public to fix it.
