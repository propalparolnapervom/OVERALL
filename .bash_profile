alias docker_purge='for cnt in $(docker ps --all -q); do docker stop $cnt; docker rm $cnt; done; for img in $(docker image ls -q); do docker rmi $img; done'

alias lstcp='sudo lsof -iTCP -sTCP:LISTEN -n -P'









