
def save_new_user(name, email, birth_year)

  SQL
  db =SQLite3::Database.new('users.sqlite3')

  rows= db.execute <<-SQL
  create table if not exists users (name varchar(255), email varchar(255),birth_year int);

  SQL
  db.execute 'INSERT INTO users(name, email,birth_year) VALUES (?,?,?)',[name,email,birth_year]
  users =db.execute 'select * from users'

  puts 'Nuevo usuario guardado'
  users
end



