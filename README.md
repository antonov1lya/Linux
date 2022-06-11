# Репозиторий для лабораторных работ по Linux Антонова Ильи группа 20ПМИ2
## Лабораторная работа №1

Техническое задание: доработать сценарий удаления - добавить возможность резервного копирования
пользовательских данных

Реализация задания в файле /lr01-batch-user-reg/batch_delete_users.sh

Что сделано:
- при вызове batch_delete_users.sh с параметром with-backup происходит резервное копирование 
данных пользователей из файла users_list.txt, а затем их удаление 
- в batch_delete_users.sh в следующей строчке после комментария #settings можно указать директорию,
в которую будет осуществляться резерное копирование. По умолчанию: /opt
- название архива с резервной копией имеет формат: backup_&#24;месяц_$дата_$год_$час_$минута_$секунда.tar,
где временные метки соответствуют моменту резерного копирования
- если пользователь существует и у него есть папка в /home, то результатом удаления будет вывод:
```
backup done
delete done
```
-если пользователь не существует и у него нет папки в /home, то удаление и резервное копирование
осуществить невозможно и будет вывод:
```
backup error: user directory does not exits
delete error: user does not exits
```
- архив резервного копирования будет создан в любом случае, но в нем будут только папки пользователей,
которые существовали до удаления
## Лабораторная работа №2
Отчет в файле lr02-antonov.pdf
