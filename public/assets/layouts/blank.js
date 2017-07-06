/*! layouts/home.js 
	variables : BASE_URL, STATICS_URL, MODULOS_JSON, DATA
*/

$( document ).ready(function() {
	var blank_template = $("#blank-template").html();
	var template = Handlebars.compile(blank_template);

	Handlebars.registerPartial("yield", $("#yield").html());

	var data = {
		'BASE_URL' : BASE_URL, 
		'STATICS_URL' : STATICS_URL,
		'DATA' : DATA
	};
	var template_compiled = template(data);

	$('body').html(template_compiled);
});

Handlebars.registerHelper('getValue', function(obj, key) {
    return obj[key];
});