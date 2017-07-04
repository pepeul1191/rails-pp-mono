Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'login#index'
	# login
	get 'login' => 'login#index'
	post 'login/acceder' => 'login#acceder'
    get 'login/ver' => 'login#ver'
    get 'login/cerrar' => 'login#cerrar'
	# error
	get 'error/access/:id' => 'error#access'
	# home
	get 'home' => 'home#index'
	# accesos
	get 'accesos' => 'accesos/sistema#index'
	# accesos / estado_usuarios
	get 'accesos/estado_usuario/listar' => 'accesos/estado_usuario#listar'
	# accesos / sistema
	get 'accesos/sistema/listar' => 'accesos/sistema#listar'

	get 'ulima' => 'ulima/practica#index'
	get 'ulima/practica1/tipos_pokemones' => 'ulima/tipo_pokemon#index'
	get 'ulima/practica1/tipo_pokemon/agregar' => 'ulima/tipo_pokemon#agregar'
	post 'ulima/practica1/tipo_pokemon/guardar' => 'ulima/tipo_pokemon#guardar'
	get 'ulima/practica1/tipo_pokemon/editar/:id' => 'ulima/tipo_pokemon#editar'
	get 'ulima/practica1/tipo_pokemon/eliminar/:id' => 'ulima/tipo_pokemon#eliminar'

	get 'ulima/practica1/pokemones' => 'ulima/pokemon#index'
	get 'ulima/practica1/pokemon/agregar' => 'ulima/pokemon#agregar'
	post 'ulima/practica1/pokemon/guardar' => 'ulima/pokemon#guardar'
	get 'ulima/practica1/pokemon/editar/:id' => 'ulima/pokemon#editar'
	get 'ulima/practica1/pokemon/ver/:id' => 'ulima/pokemon#ver'
	get 'ulima/practica1/pokemon/eliminar/:id' => 'ulima/pokemon#eliminar'

	get 'ulima/practica2/departamento' => 'ulima/departamento#index'
	get 'ulima/practica2/departamento/buscar' => 'ulima/departamento#buscar'
end
