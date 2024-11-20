# DevOps


## [DO1_Linux](https://github.com/Tixon-noxit/DevOps/tree/main/D01_Linux)

 Linux System Installation and Configuration
### Описание
Этот проект посвящён установке и настройке операционной системы Ubuntu 20.04 Server LTS в виртуальной среде VirtualBox. Проект охватывает ключевые аспекты администрирования Linux, включая создание пользователей, настройку сети, обновление системы, работу с текстовыми редакторами, установку SSH-сервиса и управление системными задачами с помощью cron.

#### Ключевые особенности
  - Установка и настройка серверной версии Ubuntu без графического интерфейса.
  - Создание пользователей и настройка прав доступа.
  - Настройка сетевых параметров и управление IP-адресами.
  - Обновление системы и установка дополнительных утилит.
  - Использование SSH для удалённого доступа к серверу.
  - Работа с системными журналами и автоматизация задач с помощью cron.

#### Архитектура:
  - Проект выполнен в виде последовательного выполнения задач, каждая из которых сосредоточена на определённой области администрирования системы. Структура проекта основана на пошаговом обучении, где каждая часть заканчивается конкретными заданиями и результатами.

#### Функциональность:
  - Установка Ubuntu Server без GUI и проверка версии.
  - Создание нового пользователя и добавление его в группу adm.
  - Настройка сети, установка статического IP и DNS.
  - Обновление системы и работа с sudo.
  - Установка и настройка сервисов времени и SSH.
  - Установка текстовых редакторов и работа с файлами.
  - Использование утилит для мониторинга системы (top, htop) и управления дисковым пространством (df, du, ncdu).
  - Работа с системными логами и использование cron для планирования задач.

#### Инструменты и технологии:
  - `Ubuntu 20.04 Server LTS`
  - `VirtualBox`
  - Командная строка `Linux`
  - `SSH`
  - Текстовые редакторы (`VIM`, `NANO`)
  - Утилиты мониторинга (`top`, `htop`, `ncdu`)
  - Системные утилиты для работы с дисками (`df`, `du`, `fdisk`)
  - `Cron` для автоматизации задач

### Результаты и достижения:
  - Успешная установка Ubuntu Server в виртуальной среде.
  - Создание пользователя с правами администратора.
  - Настройка сети с использованием статического IP и публичных DNS-серверов.
  - Обновление всех пакетов до последней версии и успешная настройка SSH для удаленного доступа.
  - Установка и изучение работы с несколькими текстовыми редакторами.
  - Освоение утилит для мониторинга и управления ресурсами системы, а также успешное выполнение задач с помощью cron.

---

## [Linux Network](https://github.com/Tixon-noxit/DevOps/tree/main/DO2_LinuxNetwork)

### Описание
Проект по настройке и оптимизации сетевых параметров на Linux-системах, включающий управление маршрутизацией, настройку межсетевого экрана, динамическое и статическое распределение IP-адресов через DHCP и NAT.

#### Архитектура:
  - Использование сетевых утилит и конфигурационных файлов (Netplan, resolv.conf) для управления сетевыми интерфейсами.
  - Создание скриптов для автоматизации процессов маршрутизации и настройки iptables.
  - Поддержка статической и динамической маршрутизации с возможностью мониторинга и анализа сетевого трафика.
    
#### Функциональность:
  - Сетевой анализ: Определение сетевых адресов, диапазонов хостов и классификация IP-адресов с помощью ipcalc.
  - Маршрутизация: Настройка сетевых интерфейсов, добавление статических маршрутов, IP-переадресация.
  - Производительность: Измерение скорости соединения между машинами с использованием iperf3.
  - Безопасность: Создание скриптов для настройки межсетевого экрана через iptables, проверка уязвимостей с nmap.
  - DHCP: Настройка автоматического назначения IP-адресов.
  - NAT: Реализация трансляции сетевых адресов для совместного использования интернет-соединений.
    
#### Инструменты и технологии:
  - Сетевые утилиты: `ipcalc`, `ip`, `Netplan`, `iperf3`, `traceroute`.
  - Мониторинг и безопасность: `tcpdump`, `iptables`, `nmap`.
  - Управление DHCP: `resolv.conf`, `systemctl`.

### Результаты и достижения:
  - Успешная конфигурация сетевых параметров на Ubuntu Server, включая настройку статической маршрутизации и межсетевого экрана.
  - Реализация и тестирование IP-переадресации и NAT, обеспечивающих стабильное соединение.
  - Настройка DHCP для автоматического назначения IP-адресов.
  - Оптимизация сетевых соединений и обеспечение их безопасности с использованием iptables и nmap.
  - Успешная интеграция статической маршрутизации с IP-мониторингом и анализом трафика.

---

## [Simple Docker](https://github.com/Tixon-noxit/DevOps/tree/main/DO5_SimpleDocker)

### Описание
Проект по разработке и управлению Docker-образами для веб-сервера Nginx.

### Задачи
1. **Готовый Docker**: Скачивание и настройка официального образа Nginx.
2. **Операции с контейнером**: Изучение и настройка файла `nginx.conf`.
3. **Мини-сервер**: Разработка мини-сервера на C и FastCGI.
4. **Создание Docker-образа**: Создание образа с мини-сервером и настройка проксирования.
5. **Проверка безопасности**: Анализ Docker-образа с помощью Dockle.
6. **Основы Docker Compose**: Разработка файла `docker-compose.yml` для развертывания нескольких Docker-образов.

### Технологии
- Docker
- Nginx
- FastCGI
- C
- Dockle
- Docker Compose

---

## [Basic CI/CD](https://github.com/Tixon-noxit/DevOps/tree/main/DO6_CICD)

### Описание
Настройка непрерывной интеграции и развертывания для проекта SimpleBashUtils с использованием GitLab CI/CD.

### Задачи
1. **Настройка окружения**: Установка Ubuntu Server и GitLab Runner.
2. **Сборка приложений**: Реализация CI этапа сборки приложений с использованием Makefile.
3. **Кодстайл тестирование**: Проверка стиля кода с помощью clang-format.
4. **Интеграционные тесты**: Написание CI этапа для интеграционных тестов.
5. **Развертывание**: Автоматическое развертывание на виртуальной машине через bash-скрипт.
6. **Уведомления**: Настройка уведомлений о статусе пайплайнов через Telegram-бота.

### Технологии
- GitLab Runner
- Ubuntu Server 22.04 LTS
- Makefile
- clang-format
- bash
- ssh, scp
- GitLab CI/CD
