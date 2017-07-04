# config/initializers/databases.rb
require 'sqlite3'
require 'sequel'

class Databases
	@db_accesos = Sequel.connect(:adapter=>'sqlite', :database=>File.expand_path('../../../db/db_accesos.db', __FILE__))
	@db_pokemones = Sequel.connect(:adapter=>'sqlite', :database=>File.expand_path('../../../db/db_pokemones.db', __FILE__))
	@db_peru = Sequel.connect(:adapter => 'mysql2', :host => 'localhost', :port => '3306', :database => 'db_peru', :user => 'root', :password=>'123')
	
	def self.db_accesos
		@db_accesos
	end

	def self.db_pokemones
		@db_pokemones
	end

	def self.db_peru
		@db_peru
	end
end