# Інтерфейс для роботи з базою даних
module Database
  def database_connect
    raise NotImplementedError, 'Метод connect повинен бути визначений у класі'
  end

  def database_execute_query(query)
    raise NotImplementedError, 'Метод execute_query повинен бути визначений у класі'
  end
end

# Клас для роботи з PostgreSQL
class PostgreSQLDatabase
  include Database
  def connect
    puts 'Підключення до PostgreSQL'
  end

  def execute_query(query)
    puts "Виконання запиту в PostgreSQL: #{query}"
  end
end

# Клас для роботи з MySQL
class MySQLDatabase
  include Database
  def connect
    puts 'Підключення до MySQL'
  end

  def execute_query(query)
    puts "Виконання запиту в MySQL: #{query}"
  end
end

# Адаптер класів для роботи з різними базами даних
class DatabaseAdapter
  include Database
  def initialize(database)
    @database = database
  end

  def database_connect
    @database.connect
  end

  def database_execute_query(query)
    @database.execute_query(query)
  end
end

# Клієнтський код
postgresql_db = PostgreSQLDatabase.new
mysql_db = MySQLDatabase.new

adapter_for_postgresql = DatabaseAdapter.new(postgresql_db)
adapter_for_mysql = DatabaseAdapter.new(mysql_db)

adapter_for_postgresql.database_connect
adapter_for_postgresql.database_execute_query('SELECT * FROM users')

adapter_for_mysql.database_connect
adapter_for_mysql.database_execute_query('SELECT * FROM customers')