class ReportPdf < Prawn::Document
  def initialize(avaluo,users)
      super()
      @avaluo = avaluo
      @users = users
      first_page
    end

    def first_page
      header
      move_down 30
      #move_right 50
      font("Times-Roman") do
        text "INMOBILIARIA Y SERVICIOS ADMINISTRATIVOS LTDA", :align => :left, :size => 8, :style => :bold,:indent_paragraphs => 50
      end
      font("Times-Roman") do
        text "CL 38 # 13-37 PS 6", :align => :left, :size => 8,:indent_paragraphs => 50
      end
      font("Times-Roman") do
        text "BOGOTA", :align => :left, :size => 8,:indent_paragraphs => 50
      end
      font("Times-Roman") do
        text "Tel. 3230450", :align => :left, :size => 8, :indent_paragraphs => 50
      end
      move_down 5
      box_one
      box_two
      box_three
      box_four
      box_five
      footer
    end


    def header
      image "#{Rails.root}/app/assets/images/logo.png", width: 120, height: 62, :position => :left
    end

    def footer
      bounding_box([bounds.left, bounds.bottom + 50], :width => bounds.width, :height => 100) do
        image "#{Rails.root}/app/assets/images/footer.png", fit: [bounds.width, 100]
      end
    end

    def box_content(string)
      font("Times-Roman") do
        text "<u>#{string}</u>", :align => :left, :size => 9, :style => :bold, :inline_format => true
      end
      transparent(0.5) { stroke_bounds }
    end

    def box_two
      move_down 10
      bounding_box([bounds.left + 50, cursor], :width => bounds.width - 100, :height => 80) do
        box_content("Informacion del barrio")

      end
    end

    def box_three
      move_down 10
      bounding_box([bounds.left + 50, cursor], :width => bounds.width - 100, :height => 70) do
        box_content("Informacion del inmueble")
        move_down 5
        font("Times-Roman") do
          text_box "<b>Tipo</b>  #{@avaluo.inmueble_tipo} ", :at => [0,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Tipo Vivienda</b>  #{@avaluo.inmueble_tipo_vivienda} ", :at => [(bounds.width - 100)/3,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Tipo Vivienda</b>  #{@avaluo.inmueble_ubicacion} ", :at => [(bounds.width - 100)/1.5,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Chip</b>  #{@avaluo.chip} ", :at => [(bounds.width - 100),cursor], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Uso</b>  #{@avaluo.inmueble_uso} ", :at => [0,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Clae</b>  #{@avaluo.inmueble_clase} ", :at => [(bounds.width - 100)/1.5,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. Principal 1</b>  #{@avaluo.m_inmob_principal_1} ", :at => [0,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. GJ 2</b>  #{@avaluo.m_inmob_gj_2} ", :at => [(bounds.width - 100)/2,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. GJ 5</b>  #{@avaluo.m_inmob_gj_5} ", :at => [(bounds.width - 100),cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true

          text_box "<b>M. Inmob. Principal 2</b>  #{@avaluo.m_inmob_principal_2} ", :at => [0,cursor - 24], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. GJ 3</b>  #{@avaluo.m_inmob_gj_3} ", :at => [(bounds.width - 100)/2,cursor - 24], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. DP 1</b>  #{@avaluo.m_inmob_dp_1} ", :at => [(bounds.width - 100),cursor - 24], :width => 100, height: 10, :size => 6, :inline_format => true

          text_box "<b>M. Inmob. GJ 1</b>  #{@avaluo.m_inmob_gj_1} ", :at => [0,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. GJ 4</b>  #{@avaluo.m_inmob_gj_4} ", :at => [(bounds.width - 100)/2,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>M. Inmob. DP 2</b>  #{@avaluo.m_inmobiliaria_dp_2} ", :at => [(bounds.width - 100),cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true

          text_box "<b>Num. Escritura</b>  #{@avaluo.inmueble_num_escritura} ", :at => [0,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Num. Escritura</b>  #{@avaluo.inmueble_num_notaria} ", :at => [(bounds.width - 100)/3,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Fecha</b>  #{@avaluo.inmueble_fecha_escritura} ", :at => [(bounds.width - 100)/1.5,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Ciudad</b>  #{@avaluo.inmueble_ciudad} ", :at => [(bounds.width - 100),cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true

        end
      end
    end

    def box_four
      move_down 10
      bounding_box([bounds.left + 50, cursor], :width => bounds.width - 100, :height => 65) do
        box_content("Informacion de la construccion")
        text_box "<b>Numero de pisos</b>  #{@avaluo.construccion_numero_de_pisos} ", :at => [0,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Numero de sotanos</b>  #{@avaluo.construccion_numero_de_sotanos} ", :at => [(bounds.width - 100)/3,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Año de construccion</b>  #{@avaluo.construccion_año_construcicon} ", :at => [(bounds.width - 100)/1.5,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Vetustez</b>  #{@avaluo.construccion_vetustez} ", :at => [(bounds.width - 100),cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estado de construccion</b>  #{@avaluo.construccion_estado} ", :at => [0,cursor-8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estado de conservacion</b>  #{@avaluo.construccion_esatdo_de_conservacion} ", :at => [(bounds.width-100)/2,cursor-8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estructura material</b>  #{@avaluo.construccion_estructura_1} ", :at => [0,cursor-16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estructura tipo</b>  #{@avaluo.construccion_estructura_2} ", :at => [(bounds.width-100)/2,cursor-16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estructura otro</b>  #{@avaluo.construccion_estructura_otro} ", :at => [(bounds.width-100),cursor-16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Fachada</b>  #{@avaluo.construccion_fachada} ", :at => [0,cursor-24], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Cubierta</b>  #{@avaluo.construccion_cubierta} ", :at => [0,cursor-32], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Irre. de la planta</b>  #{@avaluo.construccion_irregularidad_planta} ", :at => [0,cursor-40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>D previo</b>  #{@avaluo.construccion_daños_previos} ", :at => [(bounds.width - 100)/2,cursor-40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Est reforzada</b>  #{@avaluo.construccion_estructura_reforzada} ", :at => [(bounds.width - 100),cursor-40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Irre. altura</b>  #{@avaluo.construccion_irregularidad_altura} ", :at => [0,cursor-48], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Reparado</b>  #{@avaluo.construccion_reparados} ", :at => [(bounds.width - 100)/2,cursor-48], :width => 100, height: 10, :size => 6, :inline_format => true

      end
    end

    def box_five
      move_down 10
      bounding_box([bounds.left + 50, cursor], :width => bounds.width - 100, :height => 65) do
        box_content("Informacion de la construccion - Dependencias inmueble")
        text_box "<b>Sala</b>  #{@avaluo.construccion_sala} ", :at => [0,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Baño social</b>  #{@avaluo.construccion_baño_social} ", :at => [(bounds.width - 100)/5,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Baño priv.</b>  #{@avaluo.construccion_baño_privado} ", :at => [(bounds.width - 100)/2.5,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Baño serv.</b>  #{@avaluo.construccion_baño_servicio} ", :at => [(bounds.width - 100)/1.5,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Jardin</b>  #{@avaluo.construccion_jardin} ", :at => [(bounds.width - 100),cursor], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Comedor</b>  #{@avaluo.construccion_comedor} ", :at => [0,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estar hab</b>  #{@avaluo.construccion_estar_hab} ", :at => [(bounds.width - 100)/5,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Cocina</b>  #{@avaluo.construccion_cocina} ", :at => [(bounds.width - 100)/2.5,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Patio int</b>  #{@avaluo.construccion_patio_interior} ", :at => [(bounds.width - 100)/1.5,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Balcon</b>  #{@avaluo.construccion_balcon} ", :at => [(bounds.width - 100),cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Estudio</b>  #{@avaluo.construccion_estudio} ", :at => [0,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Habitaciones</b>  #{@avaluo.construccion_estar_hab} ", :at => [(bounds.width - 100)/5,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Cuarto serv</b>  #{@avaluo.construccion_cuarto_serv} ", :at => [(bounds.width - 100)/2.5,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Z. verde privado</b>  #{@avaluo.construccion_z_verde_privada} ", :at => [(bounds.width - 100)/1.5,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Terraza</b>  #{@avaluo.construccion_terraza} ", :at => [(bounds.width - 100),cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Iluminacion</b>  #{@avaluo.construccion_iluminacion} ", :at => [0,cursor - 24], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Ventilacion</b>  #{@avaluo.construccion_ventilacion} ", :at => [(bounds.width - 100)/2,cursor - 24], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Total garages</b>  #{@avaluo.construccion_total_garages} ", :at => [0,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Cubierto</b>  #{@avaluo.construccion_cubierto} ", :at => [(bounds.width - 100)/5,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Uso exclusivo</b>  #{@avaluo.construccion_cubierto} ", :at => [(bounds.width - 100)/2.5,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Sencillo</b>  #{@avaluo.construccion_cubierto} ", :at => [(bounds.width - 100)/1.5,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Bahia comunal</b>  #{@avaluo.construccion_servidumbre} ", :at => [(bounds.width - 100),cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Deposito</b>  #{@avaluo.construccion_deposito} ", :at => [0,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Descubierto</b>  #{@avaluo.construccion_deposito} ", :at => [(bounds.width - 100)/5,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Privado</b>  #{@avaluo.construccion_local} ", :at => [(bounds.width - 100)/2.5,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Doble</b>  #{@avaluo.construccion_bodega} ", :at => [(bounds.width - 100)/1.5,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Servidumbre</b>  #{@avaluo.construccion_servidumbre} ", :at => [(bounds.width - 100),cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Local</b>  #{@avaluo.construccion_local} ", :at => [0,cursor - 48], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Bodega</b>  #{@avaluo.construccion_bodega} ", :at => [(bounds.width - 100)/5,cursor - 48], :width => 100, height: 10, :size => 6, :inline_format => true
        text_box "<b>Oficina</b>  #{@avaluo.construccion_oficina} ", :at => [(bounds.width - 100)/2.5,cursor - 48], :width => 100, height: 10, :size => 6, :inline_format => true
      end
    end

    def box_one
      bounding_box([bounds.left + 50, cursor], :width => bounds.width - 100, :height => 120) do
        box_content("Informacioni basica")
        move_down 5
        font("Times-Roman") do
          text_box "<b>N. Solicitante</b>  #{@avaluo.nombre_solicitante} ", :at => [0,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Tipo de identificacion</b>   #{@avaluo.tipo_de_identificacion}               #{@avaluo.numero_de_identificacion} ", :at => [(bounds.width - 100)/2,cursor], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Fecha de creacion</b>   #{@avaluo.fecha_avaluo} ", :at => [0,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Fecha de correccion</b>   #{@avaluo.fecha_correcion} ", :at => [(bounds.width - 100)/2,cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Sector</b>   #{@avaluo.avaluo_type.split("-")[1]} ", :at => [(bounds.width - 100),cursor - 8], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Departamento</b>   #{@avaluo.departamento} ", :at => [0,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Ciudad</b>   #{@avaluo.departamento} ", :at => [(bounds.width - 100)/2,cursor - 16], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Direccion</b>   #{@avaluo.direccion_inmueble} ", :at => [0,cursor - 24], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Conjunto/Edificio</b>   #{@avaluo.nombre_conjunto_o_edificio} ", :at => [0,cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Barrio</b>   #{@avaluo.barrio} ", :at => [(bounds.width - 200),cursor - 32], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Entidad</b>   #{@avaluo.client.name} ", :at => [0,cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Codigo avaluo</b>   #{@avaluo.serial} ", :at => [(bounds.width - 200),cursor - 40], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Met. Valuatoria</b>   #{@avaluo.metodologia_valutoria} ", :at => [0,cursor - 48], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Objeto avaluo</b>   #{@avaluo.objeto_avaluo} ", :at => [(bounds.width - 100)/2,cursor - 48], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Est avaluo</b>    ", :at => [(bounds.width - 100),cursor - 48], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Sistema coordenadas</b>  #{@avaluo.sistemas_de_coordenadas}  ", :at => [0,cursor - 56], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Latitud</b>  #{@avaluo.latitud}  ", :at => [(bounds.width - 100)/2,cursor - 56], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Longitud</b>  #{@avaluo.longitud}  ", :at => [(bounds.width - 100),cursor - 56], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "<b>Justificacion Metodologia</b> ", :at => [0,cursor - 70], :width => 100, height: 10, :size => 6, :inline_format => true
          text_box "#{@avaluo.justificacion_metodologia}", :at => [0,cursor - 80], :width => 100, height: 10, :size => 6, :inline_format => true
        end
      end
    end
end
