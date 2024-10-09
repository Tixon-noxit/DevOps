## Part 1. Установка ОС
- Установил Ubuntu 20.04 Server LTS без графического интерфейса

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_1/Part 1.png"><br>
<hr>


## Part 2. Создание пользователя

- Создаю нового пользователя _my_user_ с помощью команды `sudo adduser my_user`

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_2/Part 2.1.png"><br>

- Добавляю пользователя в группу adm: sudo usermod -a -G adm my_user

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_2/Part 2.2.png"><br>

- Вывожу на экран список пользователей

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_2/Part 2.3.png"><br>

- Проверяю, что информация о пользователе _my_user_ присутствует в выводе:

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_2/Part 2.4.png"><br>


## Part 3. Настройка сети ОС

- Ввожу команду `sudo hostname user-1`, чтобы задать имя хоста, которое сохранится при перезапуске виртуальной машины

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.0.png"><br>

- Ввожу команду sudo timedatectl `set-timezone Europe/Moscow` и проверяю, что временная зона была изменена

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.1.png"><br>

- Вывожу названия сетевых интерфейсов в компактном виде ip -br link show

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.2.png"><br>

При выводе команды видно наличие интерфейса lo

**lo** (интерфейс loopback) — виртуальный интерфейс, который по умолчанию присутствует в любом Linux. Он используется сетевым клиентским программным обеспечением, чтобы общаться с серверным приложением, расположенным на том же компьютере. Наиболее широко используемый IP адрес в механизмах loopback — 127.0.0.1.

- Получили ip-адрес устройства от DHCP-сервера

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.3.png"><br>

Можно сделать вывод, что DHCP-сервер предложил используемому устройству адрес _10.0.2.15/24_, после чего он его использлование было подтверждено, и адрес закрепился за устройством.

**DHCP** (англ. Dynamic Host Configuration Protocol — протокол динамической настройки узла) — сетевой протокол, позволяющий сетевым устройствам автоматически получать IP-адрес и другие параметры, необходимые для работы в сети TCP/IP.

- Вывожу внешний ip-адрес шлюза с помощью команды curl icanhazip.com

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.5.png"><br>

- Вывожу внутренний ip-адрес шлюза с помощью команд ip route | grep default или hostname -I

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.6.png"><br>

- Задаю статичные настройки ip, gw, dns.

- Для начала необходимо отключить облачную инициализацию. Для этого нужно открыть файл конфигурации subiquity-disable-cloudinit-networking.cfg в каталоге /etc/cloud/cloud.cfg.d/ с помощью команды:
  sudo vim /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg

- Проверяю, что network в положении disabled.

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.7.png"><br>

- Чтобы назначить статический IP-адрес в сетевом интерфейсе, открываю файл конфигурации YAML:
  sudo nano /etc/netplan/00-installer-config.yaml

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.8.png"><br>

- Установливаю значение dhcp4 на no, чтобы отключить протокол DHCP, а также вручную задаю настройки ip, gw, dns

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.9.png"><br>

- Для применения внесенных изменений выполняю команду:

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.10.png"><br>

- Убеждаюсь,что сетевой интерфейс настроен на использование статического IP-адреса ip route show

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.11.png"><br>

- Перезапускаю виртуальную машину и проверяю, что файл с настройками не изменился

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.12.png"><br>

- Пингую удаленные хосты 1.1.1.1 и ya.ru

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_3/Part 3.13.png"><br>


## Part 4

- Для обновления системынх пакетов использую команды _update_ для синхронизации индекса пакетов из репозиториев и _upgrade_  для установки самых новых версий пакетов, установленных в системе

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_4/Part 4.png"><br>

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_4/Part 4.1.png"><br>

- Проверяю, что система была обновлена, повторно введя sudo apt-get upgrade, получаю сообщение об обновлении 0 пакетов

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_4/Part 4.1.png"><br>


## Part 5

- Добавляю пользователя my_user в группу sudo

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_5/Part 5.png"><br>

- Меняю пользователя на my_user с помощью команды su, введя пароль, заданный в Part 2 при создании пользователя

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_5/Part 5.1.png"><br>

- Меняю hostmame от лица пользователя my_user

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_5/Part 5.2.png"><br>

**sudo** (англ. Substitute User and do, дословно «подменить пользователя и выполнить») — программа для системного администрирования UNIX-систем, позволяющая делегировать те или иные привилегированные ресурсы пользователям с ведением протокола работы. Основная идея — дать пользователям как можно меньше прав, при этом достаточных для решения поставленных задач.


## Part 6. Установка и настройка службы времени

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_6/Part 6.png"><br>


## Part 7. Установка и использование текстовых редакторов

- Vim уже был предустановлен системой, поэтому устанавливаю недостающий текстовый редактор joe

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.1.png"><br>
<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.png"><br>

- и недостающий текстовый редактор mcedit

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.2.png"><br>
<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.3.png"><br>

#### Записываю ник с помощью vim

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.4.png"><br>

- Для выхода с сохранением после нажатия esc ввожу :x


#### Записываю ник с помощью joe

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.5.png"><br>

- Для выхода с сохранением пользуюсь ctrl+K, а затем клавишу X


#### Записываю ник с помощью mc
- Пользуюсь Shift+F4 для создания файла - открывается текстовый редактор по умолчанию - nano
- Создаю (сохраняю) файл при помощи ctrl+O, ввожу ник и сохраняю файл при помощи ctrl+X
- Закрываю mc клавишей F10

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.6.png"><br>


- Проверяю, что были созданы файлы, содержащие ник essiecel

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.7.png"><br>

#### Изменяю test_vim.txt

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.8.png"><br>

- Для выхода без сохранения изменений после нажатия esc ввожу :q!

#### Изменяю test_mc.txt

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.9.png"><br>

- Для выхода без сохранения изменений после ctrl+x при возникновении Save modified buffer? выбираю N

#### Изменяю test_joe.txt

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.10.png"><br>

- Для выхода без сохранения изменений после ctrl+c при возникновении Отменить изменения файла?выбераю y

#### Редактирую test_vim.txt еще раз, сохранив изменения. После ищу ss

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.11.png"><br>

- Меняю ss на rr

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.12.png"><br>

- Выхожу, сохранив изменения


#### Редактирую test_mc.txt и сохраняю изменения. Ищу ss. Для этого пользуюсь ctrl+W

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.13.png"><br>

- В результате сообщается о количестве совпадений
- Меняю ss на rr. Для этого пользуюсь ctrl+\\, ввожу заменяемое слово, нажимаю enter

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.14.png"><br>

- Ввожу слово для замены, нажимаю enter

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.10.1.png"><br>

- Подтверждаю замену, выбрав Y

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.10.2.png"><br>

- В результате получаю новое слово, выхожу с сохранением

#### Редактирую test_joe.txt и сохраняю изменения. Ищу School. Для этого использую сочетание ctrl+K+F

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.10.3.png"><br>

- Поскольку поиск осуществляется с начала блока (файла), нажимаю enter

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.10.4.png"><br>

- В результате курсор устанавливается на начало найденного слова

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.10.5.png"><br>

- Меняю все вхождения ss на rr. Для этого пользуюсь ctrl+K+F, ввожу заменяемое слово, нажимаю enter

<img title="title" alt="OS installation screenshot" src=""><br>

- Ввожу R для выбора операции замены, ввожу слово для замены, нажимаю enter

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.17.png"><br>

- Выбираю вариант заменить все с помощью R

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_7/Part 7.16.png"><br>

- В резултате получаю одну замену, выхожу с сохранением


## Part 8. Установка и базовая настройка сервиса SSHD

- Устанавливаю SSH:

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.png"><br>

[//]: # (<img title="title" alt="OS installation screenshot" src="./Screens/8.1.png"><br>)

- Устанавливаю openssh (в данном случае сообщается о том, что openssh уже установлен)

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.1.png"><br>

- Проверяю, что автостарт службы при загрузке системы был добавлен. На это указывает enabled в Loaded

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.2.png"><br>

- Устанавливаю netstat, чтобы узнать, какие порты уже задействованы и не испольовать их повторно

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.7.png"><br>
<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.3.png"><br>

- Выполняю sudo vim /etc/ssh/sshd_config

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.5.png"><br>

- Меняю Port на 2022 и выхожу, сохранив изменения.


- Перезапускаю службу SSH, чтобы изменения вступили в силу: sudo systemctl restart ssh

- Проверяю, запущен ли ssh-домен на сервере с помощью команды ps

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.6.png"><br>

Команда **_ps_**, сокращенно от _Process Status_, представляет собой утилиту командной строки, которая используется для отображения или просмотра информации, связанной с процессами, запущенными в системе Linux.

**_a_** отображает идентификаторы процессов и состояние идентификатора сеанса для каждого реального пользователя.

**_u_** — это ширина экрана по умолчанию и формат виртуальной памяти с более ценными функциями, а также общая пользовательская настройка управления форматом вывода.

**_x_** предоставляет следующие столбцы: PID, TTY, STAT, TIME, COMMAND. Вывод «x» аналогичен выводу «u», но разница в том, что «x» отображает процессы, которые выполняются без привязки к какому-либо экрану терминала.

**_grep sshd_** выводит строки, содержащие _sshd_

- Выполняю reboot и netstat -tan

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_8/Part 8.8.png"><br>

**_a_** выводит список всех портов и соединений независимо от их состояния или протокола

**_t_** выводит порты tcp

**_n_** показывает числовые адреса

**_tan_** выведет список всех портов TCP с с отображением адресов и номеров портов

- **Значения столблов:**

**_Proto_** — Протокол (tcp, udp, raw), используемый сокетом.

**_Reqv-Q_** — Счётчик байт не скопированных программой пользователя из этого сокета.

**_Send-Q_** — Счётчик байтов, не подтверждённых удалённым узлом.

**_Local Address_** — Адрес и номер порта локального конца сокета.

**_Foreign Address_** — Адрес и номер порта удалённого конца сокета.

**_State_** — Состояние сокета. **_LISTEN_** — Сокет ожидает входящих подключений.

- **Значение 0.0.0.0.**

**_IP-адрес 0.0.0.0_** — это немаршрутизируемый адрес IPv4, который можно использовать в разных целях, в основном, в качестве адреса по умолчанию или адреса-заполнителя. Он действует как резервный, пока не будет назначен действительный маршрутизируемый IP-адрес.

## Part 9. Установка и использование утилит top, htop

- Устанавливаю htop sudo apt install htop
- Выполняю top

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.png"><br>

    - uptime: 31 минута
    - количество авторизованных пользователей: 2
    - общую загрузку системы: 0,00
    - общее количество процессов: 120
    - загрузку cpu: 0.0%
    - загрузку памяти: 197.3 из 3427.6
    - pid процесса занимающего больше всего памяти: 1
    - pid процесса, занимающего больше всего процессорного времени: 1338

- htop, отсортированный по PID

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.1.png"><br>

- htop, отсортированный по PERCENT_CPU

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.2.png"><br>

- htop, отсортированный по PERCENT_MEM

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.3.png"><br>

- htop, отсортированный по TIME

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.4.png"><br>

- htop, отфильтрованный для процесса sshd

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.5.png"><br>

- htop, с найденным с помощью поиска процессом syslog

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.6.png"><br>

- Добавленный вывод hostname, clock и uptime

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_9/Part 9.7.png"><br>

## Part 10. Использование утилиты fdisk

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_10/Part 10.png"><br>

- Название: VBOX HARDDISK
- Размер: 25 Гб
- Количество секторов: 52428800
- Размер swap: 0 байт

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_10/Part 10.1.png"><br>

## Part 11. Part 11. Использование утилиты df

- Выполняю df

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_11/Part 11.png"><br>

    - размер раздела: 11758760 Кб
    - размер занятого пространства: 5352832 Кб
    - размер свободного пространства: 5786820 Кб
    - процент использования: 49%

- Единица измерения: Кб (по умолчанию количество места на дисках выводится в килобайтах, если не указан какой-либо ключ)

- Выполняю df -Th

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_11/Part 11.1.png"><br>

    - размер раздела: 12 Гб
    - размер занятого пространства: 5.2 Гб
    - размер свободного пространства: 5.6 Гб
    - процент использования: 49%

- Тип файловой системы для раздела: ext4 ((англ. fourth extended file system, ext4fs) — журналируемая файловая система)

## Part 12. Использование утилиты du

- Выполняю du

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_12/Part 12.png"><br>

- Вывожу размер папок /home, /var, /var/log в человекочитаемом виде в байтах

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_12/Part 12.1.png"><br>

- Вывожу размер каждого вложенного элемента в /var/log

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_12/Part 12.2.png"><br>

## Part 13. Установка и использование утилиты ncdu

- Устанавливаю ncdu

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_13/Part 13.png"><br>

- Вывожу размер папки /home

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_13/Part 13.1.png"><br>

- Вывожу размер папки /var

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_13/Part 13.2.png"><br>

- Вывожу размер папки /var/log

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_13/Part 13.3.png"><br>

## Part 14. Работа с системными журналами

- Открываю для просмотра /var/log/dmesg

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_14/Part 14.png"><br>

- Открываю для просмотра /var/log/syslog

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_14/Part 14.1.png"><br>

- Открываю для просмотра /var/log/auth.log

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_14/Part 14.2.png"><br>

- Время последней успешной авторизации: 21:03:17
- Имя пользователя: tikhon
- Метод входа в систему: by uid = 0 (User Identifier). Суперпользователь всегда должен иметь UID, равный нулю.
s
- Перезапускаю службу SSHd: systemctl restart ssh

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_14/Part 14.3.png"><br>

- Ищу в /var/log/auth.log сообщение о рестарте службы sshd

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_14/Part 14.4.png"><br>

## Part 15. Использование планировщика заданий CRON

- Создаю файл расписания для текущего пользователя: crontab -e

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_15/Part 15.png"><br>

- Просматриваю список текущих заданий для CRON

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_15/Part 15.1.png"><br>

- Ищу в системном журнале строчки о выполнении uptime

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_15/Part 15.2.png"><br>

- Удаляю все задания из планировщика и проверяю, что список заданий пуст

<img title="title" alt="OS installation screenshot" src="./screenshots/Part_15/Part 15.3.png"><br>