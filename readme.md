# docker build
>`docker-compose build`

# start docker container services (where docker-compose.yml is located)
>`docker-compose up -d`

# stop all docker container services
>`docker-compose down`

# stop only one service (with container name at the end)
>`docker stop postgres`

# docker volume delete
>`docker volume rm major-project ...`

# Output all volumes
>`docker volume ls`

# Output docker logs (e.g.: postgres or grapgh)
>`docker logs -f postgres`

# http://localhost:5000/graphiql

# http://localhost:5050/browser/ -> postgres admin