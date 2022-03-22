# terraform-do-docker-swarm
Digital Ocean Terraform project to implement Docker Swarm.

Step 1

Run terraform in the main folder to create the docker swarm manager.

Step 2

Login and run the command below to get your docker swarm join code.
Replace MANAGER_IP with the ip address of the docker swarm manager server.
docker swarm init --advertise-addr MANAGER_IP

Step 3

Update the web.conf file in the workers folder with the correct --token advertised after inputting the above init command.

Step 4

Run terraform in the workers folder to create the workers.

Step 5

Run the service create command below to scale out the docker swarm service.

docker service create --replicas 5 -p 80:80 --name web nginx