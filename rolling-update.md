# Rolling upgrade

Start with 6 services
```
docker service create --name webserver -p 8000:80 \
   --replicas 6 \
   --update-delay 15s \
   nginx:stable
```

Change to latest

```
docker service update --image nginx webserver
```
