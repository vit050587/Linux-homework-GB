####################################################### Разбор ДЗ
# 1. Управление пользователями

# создадим пользователя с домашней папкой и оболочкой Bash
sudo useradd -s /bin/bash -d /home/user11 -m user11

# проверим успешное создание пользователя
tail /etc/passwd
tail /etc/group
tail /etc/shadow

# зададим ему пароль отдельной командой
sudo passwd user11

# удалим юзера вместе с его домашней папкой (ключ -r)
sudo userdel user11 -r


# 2. Управление группами

# создадим новых менеджеров
sudo useradd -s /bin/bash -d /home/manager1 -m manager1
sudo useradd -s /bin/bash -d /home/manager2 -m manager2	

# создадим новых тестировщиков
sudo useradd -s /bin/bash -d /home/tester1 -m tester1
sudo useradd -s /bin/bash -d /home/tester2 -m tester2	

# создадим группы для каждого отдела
sudo groupadd managers
sudo groupadd testers
# проверим группы
tail /etc/group

# добавим сотрудников в группы своих отделов
sudo usermod -a -G testers tester1
sudo usermod -a -G testers tester2
sudo usermod -a -G managers manager1
sudo usermod -a -G managers manager2

# проверим группы
tail /etc/group

# переместим пользователя tester1 в группу managers:
# удалить пользователя из всех групп, кроме основной
usermod -G "" tester1
# или командой deluser (при наличии пакета adduser)
sudo deluser tester1 testers
# добавим его в целевую группу
sudo usermod -a -G managers tester1

# добавим пользователя manager1 в группу testers
sudo usermod -a -G testers manager1

# удалим пользователя manager1 из группы testers
sudo deluser manager1 testers


# 3. Создать пользователя с правами суперпользователя. Проверить результат.

# создадим нового админа
sudo useradd -s /bin/bash -d /home/admin -m admin

# добавим его в целевую группу
sudo usermod -a -G sudo admin

# проверим группы админа
groups admin



############################################################## cat
# Просмотр с помощью cat
cat test.txt 

# Создадим новый файл 
man ls > ls.txt

# Объединяем два файла
cat file1 file2
 
# Объединяем три файла
cat file1 file2 file3
 
# Объединяем и сохраняем в файл 
cat file1 file2 file3 > total

############################################################## Конвейер команд (pipes)
# Использование утилиты для подсчёта строк, слов и символов в файле
man wc

# Подсчитываем строки с использованием конвеера |
cat file1 | wc -l

# Подсчитываем строки в трёх файлах 
cat file1 file2 file3 | wc -l
 
# Подсчитываем байты в трёх файлах 
cat file1 file2 file3 | wc -c

# Получаем значения по количеству строк, слов и символов 
cat file1 file2 file3 | wc

# Подсчитываем слова 
cat file1 file2 file3 | wc -w

# Используем шаблон подстановки * 
cat file* | wc 

# Составляем более сложную команду
ls -l | grep txt | wc -l

# Сколько раз слово 'ты' встречается в поэме Мцыри?
cat mciri_poem.txt | grep -o 'ты' | wc -w


############################################################## Перенаправление потоков ввода-вывода

# отправим результат выполнения команды find в файл python_scripts.txt, а ошибки будем писать в errors.txt 
find / -type f -name *.py 1>python_scripts.txt 2>errors.txt

# пусть ошибки уходят в тот же файл, куда и результаты поиска
find / -type f -name *.py 1>all_results.txt 2>&1


############################################################## Мониторинг ресурсов

############################################################## Использование оперативной памяти и процессорного времени
# top
•	запустим top c сортировкой по PID
top –o PID
# Команда c меняет отображение последней колонки COMMAND
# Команда V меняет отображение последней колонки COMMAND на вид дерева

# отфильтровать процессы по пользователю
top –u user_new
# htop

# Установим
sudo apt install htop

# Запустим
htop
Команды
•	F2 – вход в меню
•	F3 – поиск по процессам
•	F5 – отображать процессы в виде дерева
•	F6 – сортировка
o	t – инверсия сортировки
•	F9 – завершить процесс (kill)
•	u – фильтрация по пользователю
•	F10 - выход


# Загруженность процессора

# Зеленым цветом в диаграмме, показывающей загруженность CPU,
# обозначается часть времени процессора, занятая процессами с
# нормальным приоритетом.
# Синим обозначается часть, занятая процессами с низким приоритетом. 
# Красным — процессы с приоритетом ядра. 
# Желтым — время процессора, потраченное на виртуализацию либо невольно 
# «украденное» другими пользователями, которые работают в других виртуальных 
# серверах, но на тех же физических ресурсах, и активно нагружают процессоры.

# Загруженность памяти

# Диаграмма, отображающая использование оперативной памяти, 
# состоит из трех цветов: зеленого, синего и желтого.

# Зеленый цвет показывает используемую оперативную память, 
# синий — буферы и 
# желтый — системный кеш.

# Возможные значения состояния процесса:

# R — [running or runnable] запущенные или находятся в очереди на запуск
# S — [interruptible sleep] прерываемый сон
# D — [uninterruptible sleep] непрерываемый сон (в основном IO)
# Z — [zombie] процесс зомби, прекращенный, но не забранный родителем
# T — Остановленный сигналом управления заданиями
# t — Остановленный отладчиком
# X — Мёртвый (не должен показываться)

### Запустить htop во время выполнения программы и найти выполняемую
# программу в списке процессов, используя поиск по ключевому слову python
# (использовать средства поиска htop).
python counter100.py > counter.log &

# Работа с фоновыми задачами
python counter100.py > /dev/null &
jobs
fg 1
Ctrl+Z
jobs
bg 1
jobs
python counter100.py > /dev/null &
jobs
kill -15 %2

# найдем среди запущенных процессов браузер Firefox
ps aux | grep firefox

# завершим процесс Firefox по его PID
kill 12512


############################################################## Мониторинг дисков
# Команда df
df -h

# После запуска программы можно увидеть название устройства (диска),
# общий размер, используемое пространство в абсолютном значении,
# доступное пространство, используемое пространство в процентах
# и путь, к которому прикреплено устройство.

df –hT --total

# Команда du
du
du -h

#Если нужно посмотреть суммарный объем файлов и папок,
# находящихся в текущей директории, следует запустить команду 
du -s
du -sh

# С итогами
du -sсh


####################################################### systemctl

# Подсчитаем количество служб на машине
systemctl | wc -l

# посмотрим инфо о службе SSH
systemctl status sshd
