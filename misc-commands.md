# Misc commands

List nodes
```
docker node ls
```

Drain tasks from node
```
docker node update --availability drain <nodeid>
```

Run a service
```
docker service create --name webserver \
   -p 8000:80 \
   --replicas 2 \
   nginx:stable
   ```

Information on a service
```
docker service inspect webserver
```

Networks in your swarm
```
docker network ls
```

Tasks for a service
```
docker service ls <servicename>
```

What is running on a particular node
```
docker node ps <node>
```
