# StarLadder тестовое приложение

Чтобы запустить локально приложение, сделайте следующее:

1. Клонируйте репозиторий.
1. Зайдите в папку с приложением и выполните `bundle install`
2. После сделайте миграции `rake db:setup`
3. Измените `database.yml` в папке `/config`
4. запустите сервер `rails server`

*Примечание:* Используйте `127.0.0.1:3000` а не `localhost:3000` иначе авторизация не работает.
