####################################################### Разбор ДЗ
# 1. Создать каталоги students и mentors в домашней директории, а в них — текстовые файлы students_list.txt и mentors_list.txt соответственно.
# создадим нужные папки
mkdir students
mkdir mentors

# 2. заполнить файлы данными
# заполним студентов
cat > students_list.txt << stop
Иван Диванов
Наталья Братан
Акиф Мамед Гадим Оглы
stop

# заполним наставников
cat > mentors_list.txt << stop
Cтивен Хокинг
Альберт Эйнштейн
stop


#	3. Переместите файл mentors_list.txt в папку students.
mv mentors/mentors_list.txt students/
 

# 4. Удалите папку mentors.
# способ из прошлого урока
rm -r mentors/

# безопасный способ удаления только пустого каталога
rmdir mentors/


# 5. Переименуйте папку students в students_and_mentors.
mv students students_and_mentors
 

# 6. Удалите папку students_mentors вместе с содержимым.
# правильное удаление (с ключом –r)
rm -r students_mentors


# 7. Подключитесь к машине с Linux по протоколу SSH.
ssh student@192.168.0.107


#################################################### Права в Linux

# Информация о пользователе
whoami

# В каких группах состоит текущий пользователь
groups

# Создание пользователя
sudo useradd -m -s /bin/bash user1

# Определяем пароль для пользователя
sudo passwd user1

# Параметры будут даны пользователю после создания по умолчанию
useradd -D

# Зайдём в оболочку под другим пользователем
su user1

# Проверим
whoami

# Выйти из сессии этого пользователя
exit

# удаление пользователя
whatis userdel
userdel -- help
userdel -fr user1

#заблокировать пользователя
sudo usermod –L user1
#разблокировать пользователя
sudo usermod –U user1

# дать пользователю права суперпользователя (root), добавив его в группу "sudo"
sudo usermod -G sudo user1



# переключимся в режим суперпользователя
sudo su
	В строке приглашения знак $ изменился на #

# убедимся, что мы работаем под суперпользователем
whoami

# в данном режиме не требуется для привилегированных операций каждый раз набирать префикс sudo
apt update

# выйдем из этого режима
exit

# в обычном режиме (без привилегий) команду обновления репозиториев надо выполнять с префиксом sudo, иначе получим ошибку нехватки прав
apt update
sudo apt update


# создать пользователя отдельно без пароля
sudo useradd -m -d /home/user2 -s /bin/bash user2


# зададим пароль пользователю
sudo passwd user1

# зайдем из-под него
su user1

# убедимся, что мы работаем под новым пользователем
whoami


# заглянем в файлик passwd
more /etc/passwd


# можно отфильтровать по имени пользователя
more /etc/passwd | grep ^user

# список групп
more /etc/group

# пароли (их хэши)
more /etc/shadow


# удалим с ключом  –f (force, принудительно)
sudo userdel –f user9


# создадим группу dev_team
groupadd dev_team
# проверим
more /etc/group | grep dev


# добавим в группу участника команды разработки (user11)
sudo usermod -G dev_team user11


