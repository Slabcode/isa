class InRuCrsController < ApplicationController
  before_action :set_in_ru_cr, only: [:show, :edit, :update, :destroy]

  # GET /in_ru_crs
  # GET /in_ru_crs.json
  def index
    @in_ru_crs = InRuCr.all
  end

  # GET /in_ru_crs/1
  # GET /in_ru_crs/1.json
  def show
  end

  # GET /in_ru_crs/new
  def new
    @in_ru_cr = InRuCr.new
  end

  # GET /in_ru_crs/1/edit
  def edit
  end

  # POST /in_ru_crs
  # POST /in_ru_crs.json
  def create
    @in_ru_cr = InRuCr.new(in_ru_cr_params)

    respond_to do |format|
      if @in_ru_cr.save
        format.html { redirect_to @in_ru_cr, notice: 'In ru cr was successfully created.' }
        format.json { render :show, status: :created, location: @in_ru_cr }
      else
        format.html { render :new }
        format.json { render json: @in_ru_cr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_ru_crs/1
  # PATCH/PUT /in_ru_crs/1.json
  def update
    respond_to do |format|
      if @in_ru_cr.update(in_ru_cr_params)
        format.html { redirect_to @in_ru_cr, notice: 'In ru cr was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_ru_cr }
      else
        format.html { render :edit }
        format.json { render json: @in_ru_cr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_ru_crs/1
  # DELETE /in_ru_crs/1.json
  def destroy
    @in_ru_cr.destroy
    respond_to do |format|
      format.html { redirect_to in_ru_crs_url, notice: 'In ru cr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_ru_cr
      @in_ru_cr = InRuCr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_ru_cr_params
      params.require(:in_ru_cr).permit(:nombre_del_solicitante, :tipo_de_identificacion, :numero_de_identificacion, :client_id, :objeto_avaluo, :fecha_avaluo, :fecha_correccion, :metodologia_valuatoria, :esatdo_avaluo, :estado_revision, :barrio, :nombre_conjunto_o_edificio, :sector, :departamento, :ciudad, :codigo_ciudad, :sistemas_de_coordenadas, :latitud, :longitud, :sistemas_de_coordenadas_otra, :direccion_inmueble, :justificacion_metodologica, :barrio_estrato,:barrio_legalidad, :barrio_topografia, :barrio_transporte, :barrio_acueducto_sector, :barrio_acueducto_predio, :barrio_alcantarillado_sector, :barrio_alcantarillado_predio, :barrio_energia_electrica_sector, :barrio_energia_electrica_predio, :barrio_gas_natural_sector, :barrio_gas_natural_predio, :barrio_telefonia_sector, :barrio_telefonia_predio, :barrio_vivienda, :barrio_industria, :barrio_comercio, :barrio_otro, :barrio_otro_nombre, :barrio_estado, :barrio_pavimentada, :barrio_andenes, :barrio_sardineles, :barrio_parques, :barrio_parqueadero, :barrio_alumbrado, :barrio_zonas_verdes, :barrio_arborizacion, :barrio_alamedas, :barrio_ciclo_rutas, :barrio_perspectivas_de_valorizacion, :inmueble_tipo, :inmueble_uso, :inmueble_tipo_otro, :inmueble_clase, :inmueble_clase_otro, :inmueble_tipo_vivienda, :m_inmob_principal_1, :m_inmob_principal_2, :m_inmob_gj_1, :m_inmob_gj_2, :m_inmob_gj_3, :m_inmob_gj_4, :m_inmob_gj_5, :m_inmob_dp_1, :m_inmobiliaria_dp_2, :chip, :inmueble_ubicacion, :inmueble_num_escritura, :inmueble_num_notaria, :inmueble_fecha_escritura, :inumueble_depto, :inmueble_ciudad, :construccion_numero_de_pisos, :construccion_numero_de_sotanos, :construccion_año_construccion, :construccion_vetustez, :construccion_estado, :construccion_terminada, :construccion_en_obra, :construccion_avance, :construccion_usada_sin_terminar, :construccion_usada_terminada, :construccion_usada_remodelado, :construccion_estado_de_conservacion, :construccion_estructura_1, :construccion_estructura_2, :construccion_estructura_otro, :construccion_fachada, :construccion_fallada_otra, :construccion_cubierta, :construccion_cubierta_otra, :construccion_irregularidad_de_la_planta, :construccion_irregularidad_altura, :construccion_daños_previos, :construccion_reparados, :construccion_estructura_reforzada, :construccion_sala, :construccion_comedor, :construccion_estudio, :construccion_baño_social, :construccion_estar_hab, :construccion_habitaciones, :construccion_baño_privado, :construccion_cocina, :construccion_cuarto_serv, :construccion_baño_servicio, :construccion_patio_interior, :construccion_terraza, :construccion_jardin, :construccion_balcon, :construccion_z_verder_privada, :construccion_iluminacion, :construccion_ventilacion, :construccion_total_garajes, :construccion_cubierto, :construccion_descubierto, :construccion_uso_exclusivo, :construccion_privado, :construccion_bahia_comunal, :construccion_sencillo, :construccion_double, :construccion_servidumbre, :construccion_deposito, :construccion_local, :construccion_bodega, :construccion_oficina, :construccion_estado_pisos, :construccion_estado_techos, :construccion_estado_muros, :construccion_estado_c_mader, :construccion_estado_c_metal, :construccion_estado_baños, :construccion_estado_cocina, :construccion_calidad_pisos, :construccion_calidad_techos, :construccion_calidad_muros, :construccion_calidad_c_mader, :construccion_calidad_c_metal, :construccion_calidad_baños, :construccion_calidad_cocina, :construccion_sometido_a_propiedad_intelectual, :conjunto_o_agrupacion_cerrada, :construccion_ubicacion_inmueble, :construccion_numero_edificios_o_casas, :construccion_unid_por_piso, :construccion_total_unidades, :construccion_porteria, :construccion_citofono, :construccion_bicicletero, :construccion_pisciona, :construccion_tanque_agua, :construccion_club_house, :construccion_gj_visitante, :construccion_juegos_niños, :construccion_cancha_mult, :construccion_bomba_eyectora, :construccion_cancha_squash, :construccion_z_verdes, :construccion_gimnasio, :construccion_golfito, :construccion_salon_comunal, :construccion_shut_basuras, :construccion_eq_presion_cons, :construccion_planta_electrica, :construccion_ascensor, :construccion_numero_ascensores, :construccion_otros_1, :construccion_otros_2, :oferta_actualidad_edificadora, :oferta_comportamiento_de_oferta_y_demanda, :oferta_tiempo_esperado_comercializacion, :ambiental_salubridad, :ambiental_arborizacion, :ambiental_parques, :ambiental_z_verdes, :ambiental_positivo_otro, :ambiental_negativo_por_aire, :ambiental_negativo_basura, :ambiental_negativo_inseguridad, :ambiental_negativo_ruido, :ambiental_negativo_aguas_servidas, :ambiental_negativo_otro,:liquidacion_1, :liquidacion_area_1, :liquidacion_valor_1, :liquidacion_2, :liquidacion_area_2, :liquidacion_valor_2, :liquidacion_3, :liquidacion_area_3, :liquidacion_valor_3, :liquidacion_4, :liquidacion_area_4, :liquidacion_valor_4, :liquidacion_5, :liquidacion_area_5, :liquidacion_valor_5, :liquidacion_6, :liquidacion_area_6, :liquidacion_valor_6, :liquidacion_7, :liquidacion_area_7, :liquidacion_valor_7, :liquidacion_8, :liquidacion_area_8, :liquidacion_valor_8, :liquidacion_9, :liquidacion_area_9, :liquidacion_valor_9, :liquidacion_10, :liquidacion_area_10, :liquidacion_valor_10, :liquidacion_calificacion_garantia, :liquidacion_valor_asegurable, :observaciones_observaciones)
    end
end
