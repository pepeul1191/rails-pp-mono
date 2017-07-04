class Ulima::DepartamentoController < ApplicationController
	layout 'ulima'
	
	def index
		render 'index'
	end

	def buscar
		nombre = params[:nombre]
		departamento = Ulima::Departamento.new
		render :plain => departamento.buscar(nombre).to_json
	end
end