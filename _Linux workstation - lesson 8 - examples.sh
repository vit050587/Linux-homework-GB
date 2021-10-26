####################################################### Разбор ДЗ-7
#	1. Подключить репозиторий с nginx любым удобным способом, установить nginx и потом удалить nginx, используя утилиту dpkg.
// добавляем ключ
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

// обновляем список репозиториев
sudo apt update

// устанавливаем веб-севрер Nginx
sudo apt install -y nginx

// удаляем Nginx
sudo dpkg -r nginx



#	2. Установить пакет на свой выбор, используя snap.
// ищем пакет
snap search postman

// устанавливаем
sudo snap install postman

// запускаем установленное ПО
postman



#	3. Настроить iptables: разрешить подключения только на 22-й и 80-й порты.
// используем политики по умолчанию на запрещение общего входящего трафика
sudo iptables -P INPUT DROP

// разрешаем подключения по порту 80
sudo iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT

// разрешаем подключения по порту 22
sudo iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT


#######################################################	Практика

#######################################################	docker
# установим пакеты, необходимые для работы apt по протоколу HTTPS

// устанавливаем пакеты докера
sudo apt install docker-ce –y
sudo apt install docker -y

# запустим hello world
sudo docker run hello-world

# список запущенных контейнеров
sudo с

# история всех контейнеров
sudo docker ps -a


// запустим контейнер с названием getting-started
docker run -dp 80:80 docker/getting-started

// удалим контейнер, указав его ID
docker stop 4fc0289cdd93

# запустим веб сервер так, чтобы консоль была свободна для ввода
docker run -it -p 80:80 nginx /bin/bash
docker run -dp 80:80 nginx

# войдем в докер 
docker exec -it jolly_meitner /bin/bash


####################################################### Dockerfile

# напишем инструкции для сборки нового образа:
cat > Dockerfile
FROM ubuntu:latest
MAINTAINER vitaly
RUN apt-get update
RUN apt-get install nginx -y
VOLUME "/var/www/html"
EXPOSE 80
CMD /usr/sbin/nginx -g "daemon off;"

# соберем образ из инструкций в Dockerfile
docker build -t my_nginx_image .

# увидеть наш новый образ можно так:
docker images

# запускаем наш образ на порту 8080
docker run -d -p 8080:80 my_nginx_image

// просмотр списка образов
docker images

// удаление образа
docker rmi –f e1f77663ea39








