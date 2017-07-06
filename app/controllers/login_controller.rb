class LoginController < ApplicationController
	layout 'blank'

	def index
		if session[:estado] == 'autenticado'
          redirect_to Constantes.base_url + 'home'
      else
          @css = ['dist/login/styles.min']
          @js = ['dist/login/app.min']
          @title = 'Bienvenido'
          render 'index'
      end
	end

	def acceder
		usuarios = Accesos::Usuario.new
		usuario = params[:usuario]
		contrasenia = params[:contrasenia]

		if usuarios.validar(usuario, contrasenia).to_s == '1'
			session[:estado] = 'autenticado'
          	session[:usuario] = usuario
          	session[:tiempo] = Time.now.strftime('%Y-%m-%d %H:%M:%S')
			redirect_to Constantes.public_url + 'home'
		else
			@css = ['assets/login/css/index']
          	@title = 'Bienvenido'
			@mensaje = true
			render 'index'
		end
	end

	def ver
      	rpta = 'usuario : ' + session[:usuario] + '</br>' + 'estado : ' + session[:estado] + '</br>' + 'tiempo : ' + session[:tiempo]
      	render :html=> rpta.html_safe
  	end

  	def cerrar
      	reset_session
       	redirect_to Constantes.base_url + 'login'
  	end
end