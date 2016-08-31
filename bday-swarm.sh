docker network create --driver overlay bday

docker service create --name voting-app \
   -p 5000:80 \
   --network bday \
   --replicas 1 \
   markemeis/votingapp_voting-app:latest

docker service create --name result-app \
   -p 5001:80 \
   --network bday \
   --replicas 1 \
   markemeis/votingapp_result-app:latest

docker service create --name worker \
   --replicas 2 \
   --network bday \
   manomarks/worker

docker service create --name redis \
   -p 6379 \
   --network bday \
   redis:alpine

docker service create --name db \
   --network bday \
   postgres:9.4
