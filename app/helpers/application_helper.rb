module ApplicationHelper
    def load_css
        rpta = ''
        if defined? @css
           @css.each do |n|
               temp = '<link href="' + Constantes.base_url + n + '.css" rel="stylesheet"/>'
               rpta = rpta + temp
           end
       end
       rpta.html_safe
    end

    def load_js
        rpta = ''
        if defined? @js
           @js.each do |n|
               temp = '<script src="' + Constantes.base_url + n + '.js" type="text/javascript"></script>'
               rpta = rpta + temp
           end
       end
       rpta.html_safe
    end

    def load_modal_css
        rpta = ''
        if defined? @modal_css
           @modal_css.each do |n|
               temp = '<link href="' + Constantes.base_url + n + '.css" rel="stylesheet"/>'
               rpta = rpta + temp
           end
       end
       rpta.html_safe
    end

    def load_modal_js
        rpta = ''
        if defined? @modal_js
           @modal_js.each do |n|
               temp = '<script src="' + Constantes.base_url + n + '.js" type="text/javascript"></script>'
               rpta = rpta + temp
           end
       end
       rpta.html_safe
    end

    def menu_submodulos(nombre_modulo)
        item = Accesos::Item.new
        items = item.menu_submodulos(Constantes.nombre_app, nombre_modulo)
        menus = []
        temp_subtitulos = []
        temp_items = {}

        for item in items
            if temp_subtitulos.exclude? item[:subtitulo]
                temp_subtitulos.push(item[:subtitulo])
                temp_items[item[:subtitulo]] = [{:item => item[:item], :url => item[:url]}]
            else
                t = temp_items[item[:subtitulo]]
                t.push({:item => item[:item], :url => item[:url]})
                temp_items[item[:subtitulo]] = t
            end
        end

        for temp_subtitulo in temp_subtitulos
            t = {:subtitulo => temp_subtitulo, :items => temp_items[temp_subtitulo]}
            menus.push(t)
        end

        rpta = '<ul class="list-group sidebar-nav-v1" id="sidebar-nav">';

        for menu in menus
            rpta = rpta + '<li class="list-group-item list-toggle"><span>'  + menu[:subtitulo] + '</span>'
            rpta = rpta + '<ul id="collapse-forms" class="collapse in" aria-expanded="true">'
            for item in menu[:items]
                rpta = rpta + '<li><a href="' + Constantes.base_url + item[:url] + '">' + item[:item] + '</a></li>'
            end
            rpta = rpta + '</ul>'
        end

        rpta = rpta + '</ul>'
        
        rpta.html_safe
    end

    def menu_modulos(nombre_modulo)
        modulos = Accesos::Modulo.new
        menus_hor = modulos.listar_menu(Constantes.nombre_app)
        rpta = ''
        
        for menu in menus_hor
            if nombre_modulo == menu[:nombre]
              rpta = rpta + '<li class="dropdown active"><a href="'+ Constantes.base_url + menu[:url] + '" class="dropdown-toggle" data-toggle="dropdown">' + menu[:nombre] + '</a></li>'
            else
              rpta = rpta + '<li class="dropdown"><a href="' + Constantes.base_url + menu[:url] + '" class="dropdown-toggle" data-toggle="dropdown">' + menu[:nombre] + '</a></li>'
            end
        end
        
        rpta.html_safe
    end

    def listar_modulos
        url = "http://localhost/accesos/modulo/listar_menu?sistema=SISTEMA_ACCESOS"
        return HTTParty.get(url)
    end
end
