/*! layouts/home.js 
	variables : BASE_URL, STATICS_URL, MODULOS_JSON, DATA
*/

$( document ).ready(function() {
	var home_template = $("#home-template").html();
	var template = Handlebars.compile(home_template);

	Handlebars.registerPartial("menu_modulos", $("#menu-modulos").html());
	Handlebars.registerPartial("yield", $("#yield").html());

	var data = {
		'BASE_URL' : BASE_URL, 
		'STATICS_URL' : STATICS_URL,
		'DATA' : DATA
	};
	var template_compiled = template(data);

	$('body').html(template_compiled);
});

Handlebars.registerHelper( "menuModulos", function (){
	var rpta = '';
	MODULOS_JSON.forEach(function(modulo) {
	    rpta = rpta + '<li class="dropdown"><a href="' + BASE_URL + modulo['url'] + '" class="dropdown-toggle" data-toggle="dropdown">' + modulo['nombre'] + '</a></li>';
	});
	return rpta;    
});

Handlebars.registerHelper('getValue', function(obj, key) {
    return obj[key];
});