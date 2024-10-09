## Part 1. Ready-made docker
***

Docker у меня же уже был установлен

- Запускаю его командой `open -a docker`

- Аккаунт в Docker у меня уже был, поэтому в `Dockerhub` и нахожу официальный docker-образ с `nginx`.


![images](screenshots/Part_1/1.png)

- Качаю докер-образ указанной командой `docker pull nginx`

![images](screenshots/Part_1/2.png)

- Проверяю наличие образа через команду `docker images`

![images](screenshots/Part_1/3.png)

- Запускаю docker-образ через команду `docker run -d -p 80:80 [image_id|repository]`
- -d: это флаг, который указывает Docker на запуск контейнера в фоновом режиме (detached mode). Это означает, что контейнер будет работать в фоновом режиме, и командная строка будет освобождена для дальнейшего использования.
- -p: это флаг, который указывает порт моей машины и пот контейнера для доступа из вне. По-умолчанию все порты в контейнере недоступны снаружи.

![images](screenshots/Part_1/4.png)

- Проверяю что контейнер успешно запустился через команду `docker ps`

![images](screenshots/Part_1/5.png)

- Смотрю информацию о контейнере через команду `docker inspect priceless_hamilton`

![images](screenshots/Part_1/6.png)

- Смотрю размер контейнера `docker inspect priceless_hamilton --size | grep -i -e Size`

![images](screenshots/Part_1/7.png)

- Смотрю список замапленных портов командой `docker inspect priceless_hamilton --size | grep -A 2 -i -e Exposed`

![images](screenshots/Part_1/8.png)

- Смотрю IP контейнера командой `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' priceless_hamilton`

![images](screenshots/Part_1/9.png)

- Останавливаю docker-образ командой `docker stop priceless_hamilton`. Проверяю, что образ успешно остановился через уже знакомую команду `docker ps`.

![images](screenshots/Part_1/10.png)

- Заапускаю docker-образ с портами 80:80 и 443:443 чере команду `docker run -d -p 80:80 -p 443:443 nginx`

![images](screenshots/Part_1/11.png)

- Проверяю, что все работает, открыв в браузере страницу по адресу localhost

![images](screenshots/Part_1/12.png)

- перезапускаю контейнер через команду `docker restart [container_id|container_name]` 

![images](screenshots/Part_1/13.png)

- Проверяю, что контейнер снова запустился командой `docker ps`

![images](screenshots/Part_1/14.png)
***


## Part 2. Operations with container
***

- Читаю конфигурационный файл nginx.conf внутри docker-контейнера через команду `docker exe`

![images](screenshots/Part_2/1.png)

- Создаю на локальной машине файл nginx.conf.

![images](screenshots/Part_2/2.png)

- Настраиваю в нем по пути /status отдачу страницы статуса сервера nginx.

![images](screenshots/Part_2/3.png)

- Копирую созданный файл nginx.conf внутрь докер-образа через команду `docker cp`

![images](screenshots/Part_2/4.png)

- Перезапускаю nginx внутри докер-образа через команду `docker exec romantic_carver nginx -s reload`.

![images](screenshots/Part_2/5.png)

- Проверяю, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![images](screenshots/Part_2/6.png)

- Экспортирую контейнер в файл container.tar через команду `docker export`.

![images](screenshots/Part_2/7.png)

- Остановливаю контейнер.

![images](screenshots/Part_2/8.png)

- Удаляю образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры.

![images](screenshots/Part_2/9.png)

- Удаляю остановленный контейнер.

![images](screenshots/Part_2/10.png)

- Импортирую контейнер обратно через команду `docker image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]` в моем случае `docker import -c 'cmd ["nginx", "-g", "daemon off;"]' -c 'ENTRYPOINT ["/docker-entrypoint.sh"]' container.tar nginx`.

![images](screenshots/Part_2/11.png)
![images](screenshots/Part_2/12.png)

- Запускаю импортированный контейнер командой `docker run -d -p 80:80 -p 443:443 nginx`.

![images](screenshots/Part_2/13.png)

- Проверяю, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![images](screenshots/Part_2/14.png)
***

## Part 3. Mini web server
***

- Пишу мини-сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!.
- Чтобы это сделать необходимо создать `.c` файл, в котором будет описана логика сервера (в этом случае - вывод сообщения Hello World!), а также конфиг `nginx.conf`, который будет проксировать все запросы с порта 81 на порт 127.0.0.1:8080

![images](screenshots/Part_3/1.png)

![images](screenshots/Part_3/2.png)

![images](screenshots/Part_3/3.png)

- Запускаю написанный мини-сервер через spawn-fcgi на порту 8080.

    - Для этого выкачаем новый docker-образ и на его основе запустим новый контейнер

    ![images](screenshots/Part_3/4.png)
    
    - Копирую файл конфига и логику сервера в новый контейнер 

    ![images](screenshots/Part_3/5.png)

    - Установлю требуемые утилиты для запуска мини веб-сервера на FastCGI, в частности spawn-fcgi и libfcgi-dev

    ![images](screenshots/Part_3/6.png)

    - Компилирую командо  `gcc -I/usr/local/include server.c -lfcgi -o server` и запускаю мини веб-сервер через команду `spawn-fcgi` на порту 8080

    ![images](screenshots/Part_3/7.png)

    - Делаю рестарт nginx

    ![images](screenshots/Part_3/8.png)

- Проверяю, что в браузере по localhost:81 отдается написанная мной страничка.

![images](screenshots/Part_3/9.png)

***

## Part 4. Your own docker

***

### Пишу свой докер-образ, который:
  
#### собирает исходники мини сервера на FastCgi из [Части 3](#part-3-mini-web-server);

- Файлы после наполнения

  ![images](screenshots/Part_4/1.png)

  ![images](screenshots/Part_4/2.png)

  ![images](screenshots/Part_4/3.png)

- Собираю написанный docker-образ через команду `docker build`, при этом указав имя и тэг контейнера

[//]: # (  ![images]&#40;screenshots/Part_4/4.png&#41;)
  ![images](screenshots/Part_4/5.png)

- Проверяю что все собралось, проверив наличие соответствующего образа командой `docker images`
  
  ![images](screenshots/Part_4/6.png)

-  Запускаю собранный docker-образ с мапингом порта 81 на порт 80 локальной машины, а также мапингом папки ./nginx внутрь контейнера по адресу конфигурационных файлов nginx'а, и проверю, что страничка написанного сервера по адресу

  ![images](screenshots/Part_4/7.png)

- В в файле `nginx.conf` уже прописано проксирование странички `/status`, по которой необходимо отдавать статус сервера `nginx`

  ![images](screenshots/Part_4/3.png)

- Проверяю, что по localhost:80 доступна страничка написанного мини сервера.

  ![images](screenshots/Part_4/8.png)

***

## Part 5. Dockle

***

- Перед выполнением данного шага необходимо установить утилиту dockle, [инструкция по установке](https://github.com/goodwithtech/dockle), если машина [не видит утилиту ](https://github.com/aquasecurity/trivy/issues/2432), также рекомендую добавить своего пользователя в группу docker.
  

- Устанавливаю утилиту командой `brew install goodwithtech/r/dockle`

  ![images](screenshots/Part_5/1.png)  


- Пытался запустить dockle, но столкнулся с ошибками при запуске. Исправляю командой `docker run --rm -v /var/run/docker.sock:/var/run/docker.sock goodwithtech/dockle:v0.3.1 dockle-ci-audit:$CIRCLE_SHA1`  


- Сканирую образ из предыдущего задания через `dockle [image_id|repository]`

  ![images](screenshots/Part_5/2.png)

- Исправлю конфигурационные файлы docker-образа так, чтобы при проверке через утилиту dockle не возникало ошибок и предупреждений

  ![images](screenshots/Part_5/3.png)

***

## Part 6. Basic **Docker Compose**

***

- Перед выполнением данного шага необходимо установить утилиту `docker-compose`, [инструкция по установке](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)  
  

- У меня она уже была установлена

  ![images](screenshots/Part_6/1.png)

- Остановливаю все запущенные контейнеры командой `docker stop`

  ![images](screenshots/Part_6/2.png)  

- Изменяю конфигурационные файлы (их можно найти в папке Part6/build)
  
- Собераю контейнер командой `sudo docker-compose build`
  

  ![images](screenshots/Part_6/3.png)  

- Запускаю собранный контейнер командой `docker compose up`

  ![images](screenshots/Part_6/4.png)    
    

- Проверяю, что в браузере по localhost:80 отдается написанная мной страничка, как и ранее

  ![images](screenshots/Part_6/5.png)  
  

- Ура!