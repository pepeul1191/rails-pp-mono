class HomeController < ApplicationController
	layout 'home'
	def index
	    #logeado
	    #tiempo
	    @css = ['dist/home/styles.min']
        @js = ['dist/home/app.min']
	    @title = 'Home'
	    @title_form = 'Bienvenido'
	    render 'index'
	end
end