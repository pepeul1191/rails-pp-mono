class Constantes
	@nombre_app = 'SISTEMA_ACCESOS'
	@sistema_id = '1'
	@base_url = 'http://localhost:3100/'
	@public_url = 'http://localhost:3100/'

	def self.sistema_id
		@sistema_id
	end

	def self.nombre_app
		@nombre_app
	end

	def self.base_url
		@base_url
	end

	def self.public_url
		@public_url
	end
end