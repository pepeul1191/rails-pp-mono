class Ulima::PokemonController < ApplicationController
	layout 'ulima'
	
	def index
		pokemon = Ulima::Pokemon.new
		@pokemones = pokemon.listar
		render 'index'
	end

	def agregar
		@operacion = 'crear'
		@titulo_operacion = 'Agregar'
		tipo_pokemon = Ulima::TipoPokemon.new
		@tipo_pokemones = tipo_pokemon.listar

		render 'pokemon'
	end

	def guardar
		operacion = params[:operacion]
		nombre = params[:nombre]
		hp = params[:hp]
		tipo_id = params[:tipo_id]

		if operacion =='crear'
			pokemon = Ulima::Pokemon.new
			pokemon.crear(nombre, hp, tipo_id)
			@mensaje = 'Se ha añadido un nuevo pokemon con éxito'
		elsif operacion == 'editar'
			id = params[:id]
			pokemon = Ulima::Pokemon.new
			pokemon.editar(id, nombre, hp, tipo_id)
			@mensaje = 'Se ha editado un pokemon con éxito'
		end

		@pokemones = pokemon.listar
		render 'index'
	end

	def editar
		id = params[:id]
		tipo_pokemon = Ulima::TipoPokemon.new
		pokemon = Ulima::Pokemon.new
		
		@tipo_pokemones = tipo_pokemon.listar
		@pokemon = pokemon.obtener(id)
		@operacion = 'editar'
		@titulo_operacion = 'Editar'
		render 'pokemon'
	end

	def eliminar
		id = params[:id]
		pokemon = Ulima::Pokemon.new
		pokemon.eliminar(id)
		@mensaje = 'Se ha eliminado un tipo de pokemon con éxito'

		@pokemones = pokemon.listar
		render 'index'
	end
end