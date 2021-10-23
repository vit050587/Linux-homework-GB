####################################################### Разбор ДЗ

# 1	Вывести на экран 3 раза имя пользователя, от которого запускается команда.
# создадим файл с Bash-скриптом
cat > user3.sh
#!/bin/bash
for char in {1..3}
  do
      echo $USER
  done

# вывести на экран содержимое нового файла
cat user3.sh

# исполнить скрипт
bash user3.sh



# 2	Вывести с помощью цикла while все четные числа от 0 до 100 включительно.
# создадим файл с Bash-скриптом
cat > print100                                   
#! bin/bash/
x=0
while [ $x -lt 102 ]
do
      # echo $x # будет выводить каждое число в новой строке
      printf "${x} "
      let x+=2
      # x=$(( $x + 2 )) # то же присвоение, но в другом синтаксисе
done
echo "" # вывод пустой строки

# исполнить скрипт
bash user3.sh



# 3	Создать с помощью nano файл test.txt. Настроить автоматический бэкап этого файла раз в 10 минут в файл с названием test.txt.bak с использованием cron.
# создадим файл
nano test.txt

# добавим правило для планировщика задач cron
crontab –e

# вариант решения утилитой cat
*/10  * * * * cat /home/student/test.txt > /home/student/test.txt.bak
# вариант решения утилитой cp (копирование файла)
*/10  * * * * cp –b /path/to/file/test.txt /path/to/file/test.txt.bak


#######################################################	Практика

#######################################################	apt / apt-get
# получить список обновлений для всех пакетов ОС
sudo apt update

# узнать: кому именно нужны обновления
sudo apt list --upgradable

# запустить обновление
sudo apt upgrade


# Установка программ
sudo apt-get install zip
sudo apt install tree

# Удаление программ
# удалим пакет zip
sudo apt-get remove zip

# можно удалить пакет вместе с конфигами:
sudo apt-get purge zip

# посмотрим все пакеты на машине Linux
dpkg -l

# посмотрим инфо о пакете tree
dpkg –l tree

# посмотрим количество установленных пакетов
dpkg -l | wc -l
 
# Фильтрация списка ПО конвейером
dpkg –l | grep pyhton3


# snap
# если snap не установлен, то это можно сделать
sudo apt install snapd

# поиск пакета в snap
sudo snap find opera

# установим браузер Опера через snap
sudo snap install opera

# посмотрим список установленных snap-пакетов
snap list

# удалим Оперу через snap
snap remove opera

#######################################################	Работа с репозиториями
# посмотрим содержимое файла со списком репозиториев
cat /etc/apt/sources.list

# apt-add-repository - команда для добавления репозиториев
apt-add-repository --help

#######################################################	iptables
# если вдруг утилита не установлена
sudo apt install iptables

# заблокируем трафик с определенного IP-адреса
sudo iptables -t filter -A INPUT -s 192.168.56.1 -j DROP
# или так:
sudo iptables -t filter -A INPUT -s 192.168.56.1 -j REJECT

# очистим правила
sudo iptables -F INPUT

# разрешим трафик с запрещенного IP-адреса
sudo iptables -t filter -A INPUT -s 192.168.56.1 -j ACCEPT

# посмотрим правила
sudo iptables -L

# Запрещаем исходящий трафик по протоколу
sudo iptables –A OUTPUT –p tcp --dport 443 –j REJECT

# сохраним конфиги iptables
sudo iptables-save > ~/iptables_config

# восстановим сохраненные конфиги iptables
sudo iptables-restore < ~/iptables_config
