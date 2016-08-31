## Agenda
### Announcements
### Managing data for stateful docker applications
- Presented by [Portworx](https://portworx.com)

### Kubernetes running Docker birthday party
### Swarm running Docker birthday party
1. Using Docker Birthday  on Mac 1.12 beta
   - Distributed Application Bundles (DAB)
   - `bundle`, `deploy` and `stack`
1. Birthday running on swarm in the Cloud
   - Cloud - droplets built to 1.12 by hand
   - DAB experimental
      - no `deploy` or `stack`
   - Hand rolled script
1. Show mesh routing (hitting app on both nodes)
   - host names are important (i.e. unique)
   - Appears that without exposed ports tasks/containers don't end up on default overlay network
      - we created our own overlay network and added services to it directly
1. scale redis
   - App may/may not be resilient
   - [12 Factor](https://12factor.net)
1. Rolling upgrade of redis
   - set update-delay on service
   - move to new version of the image
1. Scale it back down


#### Cool stuff
1. Creating a service is easy
1. Rolling upgrade built in - need to update the service to support it or create it with the setting initially
1. Handles service failures, node failures seamlessly
1. Services scale up and down with a simple command (change to replica count not +- *number*)
1. Digital hosting is pretty slick

#### Minor issues
1. Couldn't run birthday party example w/o several changes (volumes, networks, links)
1. DigitalOcean default droplets 1.11 requiring installation by hand
1. Stacks and DAB files are still experimental in 1.12.  On Mac (probably Windows) experimental features are turned on.  On ubuntu, you have to pull the source and rebuild docker with experimental features turned on. [Expermental features](https://github.com/docker/docker/tree/master/experimental)
1. Creating DAB file removes top level networks but not the networks defined for each service (container)
1. If using links and the environment variables it creates, then your services won't be able to communicate - if you rely on the link variables and not name resolution.  See [12 factor app paterns](https:/12factor.net)
1. When creating a DAB, docker-compose file needs image attribute it can't just have build command
1. *Side note* When pulling images from dockerhub we received a `403 repository locked` message.  We changed the image to be private then back to public to fix it.
