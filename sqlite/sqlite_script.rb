require 'sqlite3'
require 'awesome_print'

db =SQLite3::Database.new('users.sqlite3')

db.execute <<-SQL
  create table if not exists users (name varchar(255), email varchar(255),birth_year int);

SQL

db.execute 'insert into users (name, email, birth_year)values(?,?,?)',['ara','ara@hotmail.com',1982]

users =db.execute 'select*from users'

ap users