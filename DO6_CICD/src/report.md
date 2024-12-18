***

## Part 1. Настройка gitlab-runner

***

`-` Поднимаю виртуальную машину Ubuntu Server 22.04 LTS

![images](screenshots/Part_1/1.png)


`-` Скачиваю и установливаю на виртуальную машину gitlab-runner.


Для этого:  

-   устанавливаю `curl` командой `sudo apt-get install -y curl`

    ![images](screenshots/Part_1/2.png)


-   Скачиваю `gitlab-runner` командой `curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash`  
  

![images](screenshots/Part_1/3.png)  

- Проверяю наличие обновлений и устанавливаю `gitlab-runner` командой `sudo apt-get install gitlab-runner`
  
  
![images](screenshots/Part_1/4.png)  

`-` Запускаю gitlab-runner командой `sudo gitlab-runner start` 

![images](screenshots/Part_1/5.png)

`-` Для регистрации использую команду `sudo gitlab-runner register` и беру URL и токен, которые получил на страничке задания (DO6_CICD) на платформе.

![images](screenshots/Part_1/6.png)

***

## Part 2. Сборка

***

`-` Пишу этап для CI по сборке приложений из проекта C2_SimpleBashUtils.

- Клонирую свой SimpleBashUtils и переношу папки с `grep` и `cat` в src - остальное удаляю за ненадобностью.

`-` Создаю в корневом каталоге файл gitlab-ci.yml  и добавляю этап запуска сборки через make-файл из проекта SimpleBashUtils.

-   ![images](screenshots/Part_2/1.png)

`-` Файлы, полученные после сборки (артефакты), сохраняю в произвольную директорию со сроком хранения 30 дней.

- Все успешно собралось - об этом говорит успешный Pipelines

- ![images](screenshots/Part_2/2.png)


***

## Part 3. Тест кодстайла

***

`-` Пишу этап для CI, который запускает скрипт кодстайла (clang-format).

`-` Если кодстайл не прошел, то «фейлю» пайплайн.

- ![images](screenshots/Part_3/1.png)

`-` В пайплайне отображаю вывод утилиты clang-format.

- ![images](screenshots/Part_3/2.png)
- ![images](screenshots/Part_3/3.png)


***

## Part 4. Интеграционные тесты

***

`-` Пишу этап для CI, который запускает мои интеграционные тесты из этого же проекта.

- ![images](screenshots/Part_4/1.png)


`-` Запущу этот этап автоматически только при условии, если сборка и тест кодстайла прошли успешно.

- ![images](screenshots/Part_4/2.png)

`-` Если тесты не прошли, то «фейлю» пайплайн.

- ![images](screenshots/Part_4/3.png)

`-` В пайплайне отображаю вывод, что интеграционные тесты успешно прошли / провалились.  

- ![images](screenshots/Part_4/4.png)
- ![images](screenshots/Part_4/5.png)



***

## Part 5. Этап деплоя

***

`-` Поднимаю вторую виртуальную машину Ubuntu Server 22.04 LTS.

- ![images](screenshots/Part_5/1.png)


- Настраиваю связь между машинами

- ![images](screenshots/Part_5/2.png)


- Пингую вторую машину с первой, чтобы убедиться, что соединение есть:

- ![images](screenshots/Part_5/3.png)


`-` Пишу этап для CD, который «разворачивает» проект на другой виртуальной машине.


- ![images](screenshots/Part_5/4.png)  


- Проверяю что этап запуска "ручной"

- ![images](screenshots/Part_5/5.png)

`-` Запускаю этот этап вручную при условии, что все предыдущие этапы прошли успешно.

- ![images](screenshots/Part_5/7.png)

`-` Пишу bash-скрипт, который при помощи ssh и scp копирует файлы, полученные после сборки (артефакты), в директорию /usr/local/bin второй виртуальной машины.

- ![images](screenshots/Part_5/6.png)

- скрипт использует команду `scp (Secure Copy Protocol)` для копирования файла с одной машины на другую по протоколу SSH (Secure Shell). 

    - scp: Это команда для копирования файлов.

    - `-P "$REMOTE_PORT"`: Опция -P используется для указания порта SSH на удаленной машине. 
    - `$REMOTE_PORT` - это переменная, которая содержит номер порта для подключения к удаленной машине.

    - `"$LOCAL_CAT_FILE"`: Это путь к локальному файлу, который я хочу скопировать. 
    - `$LOCAL_CAT_FILE` - это переменная, содержащая путь к локальному файлу.

    - `"$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"`: Это адрес удаленной машины и место, куда я хочу скопировать файл. 
    - `$REMOTE_USER` - это переменная, содержащая имя пользователя для подключения, 
    - `$REMOTE_HOST` - это переменная, содержащая IP-адрес или доменное имя удаленной машины
    - `$REMOTE_DIR/` - это переменная, содержащая путь к удаленной директории, куда я хочу скопировать файл.

    - Таким образом, вся команда scp копирует локальный файл $LOCAL_CAT_FILE на удаленную машину по SSH, используя указанный порт, имя пользователя, хост и путь на удаленной машине.


`-` В файле gitlab-ci.yml добавляю этап запуска написанного скрипта.

- ![images](screenshots/Part_5/8.png)

`-` В результате получаю готовые к работе приложения из проекта C2_SimpleBashUtils (s21_cat и s21_grep) на второй виртуальной машине.

`-` Сохраняю дампы образов виртуальных машин.

- ![images](screenshots/Part_5/9.png)


***

## Part 6. Дополнительно. Уведомления

***

`-` Настроить уведомления о успешном/неуспешном выполнении пайплайна через бота с именем «[мой nickname] DO6 CI/CD» в Telegram.
- Необходимо получить токен бота. Для этого использую инфраструктуру телеграма, а точнее главного бота "BotFather". Выполняю команды указаные ниже и получаем токен.


- ![images](screenshots/Part_6/1.png)

- Проверка что бот отвечает `https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getMe`

- ![images](screenshots/Part_6/2.png)

- Необходимо получить id чата. Для этого пишу любое сообщение боту и после в адресной строке браузера ввожу `https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates`

- ![images](screenshots/Part_6/3.png)

- В самом низу видим id со знаком `-`


- Пишу bash-скрипт для отправки сообщений в который прописываю токен бота и id чата (так делать НЕЛЬЗЯ все важные данные, логины, пароли, должны быть в виртуальном окружении, но для учебных целей пусть будет)

- ![images](screenshots/Part_6/4.png)

- Добавляю вызов скрипта для каждой цели 

- ![images](screenshots/Part_6/5.png)

- Текст уведомления содержит информацию об успешности прохождения как этапа CI, так и этапа CD.
- В остальном текст уведомления произволен.

- ![images](screenshots/Part_6/6.png)



- Конец