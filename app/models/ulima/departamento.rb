# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class Ulima::Departamento
  	def initialize
  	   @db = Databases.db_peru
  	end

  	def buscar(nombre)
            rs = @db[:vw_distrito_provincia_departamento].where(Sequel.like(:nombre, nombre + '%')).to_a
            @db.disconnect
            rs
  	end
end