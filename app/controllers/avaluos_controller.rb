class AvaluosController < ApplicationController
  before_action :set_avaluo, only: [:show, :edit, :update, :destroy]

  # GET /avaluos
  # GET /avaluos.json
  def index
    @avaluos = Avaluo.all
  end

  # GET /avaluos/1
  # GET /avaluos/1.json
  def show
  end

  # GET /avaluos/new
  def new
    @avaluo = Avaluo.new
  end

  # GET /avaluos/1/edit
  def edit
  end

  # POST /avaluos
  # POST /avaluos.json
  def create
    @avaluo = Avaluo.new(avaluo_params)

    respond_to do |format|
      if @avaluo.save
        format.html { redirect_to @avaluo, notice: 'Avaluo was successfully created.' }
        format.json { render :show, status: :created, location: @avaluo }
      else
        format.html { render :new }
        format.json { render json: @avaluo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaluos/1
  # PATCH/PUT /avaluos/1.json
  def update
    respond_to do |format|
      if @avaluo.update(avaluo_params)
        if(params.has_key?(:images))
          params[:images].each do |i|
            img = AvaluoImage.new
            img.image = i
            img.avaluo_id = @avaluo.id
            img.save
          end
        end
        if current_user.Perito?
          if params.has_key?(:finalizado)
            @avaluo.estado_avaluo = 2
             @avaluo.estado_revison = 0
            revisor = User.where(role: 1).first
            a = AvaluoUser.new
            a.avaluo_id = @avaluo.id
            a.user_id = revisor.id
            a.save
          else
            @avaluo.estado_avaluo = 1
          end
        else
          if params.has_key?(:finalizado_re)
            @avaluo.estado_avaluo = 3
            @avaluo.estado_revison = 2
          else
            @avaluo.estado_avaluo = 2
            @avaluo.estado_revison = 1
          end
        end
        @avaluo.save
        format.html { redirect_to @avaluo, notice: 'Avaluo was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaluo }
      else
        format.html { render :edit }
        format.json { render json: @avaluo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaluos/1
  # DELETE /avaluos/1.json
  def destroy
    @avaluo.destroy
    respond_to do |format|
      format.html { redirect_to avaluos_url, notice: 'Avaluo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaluo
      @avaluo = Avaluo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaluo_params
      params.require(:avaluo).permit(:serial,:nombre_solicitante,:tipo_de_identificacion,:numero_de_identificacion,:objeto_avaluo,:fecha_avaluo,:fecha_correcion,:metodologia_valutoria,:estado_avaluo,:estado_revison,:barrio,:nombre_conjunto_o_edificio,:departamento,:ciudad,:sistemas_de_coordenadas,:latitud,:longitud,:sistemas_de_coordenadas_otra,:direccion_inmueble,:justificacion_metodologia,:avaluo_type,:barrio_estrato,:barrio_legalidad_barrio,:barrio_topografia,:barrio_transporte,:barrio_acueducto_sector,:barrio_acueducto_predio,:barrio_alcantarillado_sector,:barrio_alcantarillado_predio,:barrio_energia_sector,:barrio_energia_predio,:barrio_gas_sector,:barrio_gas_predio,:barrio_telefonia_sector,:barrio_telefonia_predio,:barrio_vivienda,:barrio_industria,:barrio_comercio,:barrio_otro,:barrio_otro_name,:barrio_estado,:barrio_pavimentada,:barrio_andenes,:barrio_sardineles,:barrio_parques,:barrio_parqueadero,:barrio_alumbrado,:barrio_zonas_verdes,:barrio_arborizacion,:barrio_alamedas,:perspectivas_de_valorizacion,:inmueble_tipo,:inmueble_uso,:inmueble_uso_otro,:inmueble_clase,:inmueble_clase_otro,:inmueble_tipo_vivienda,:m_inmob_principal_1,:m_inmob_principal_2,:m_inmob_gj_1,:m_inmob_gj_2,:m_inmob_gj_3,:m_inmob_gj_4,:m_inmob_gj_5,:m_inmob_dp_1,:m_inmobiliaria_dp_2,:chip,:inmueble_ubicacion,:inmueble_num_escritura,:inmueble_num_notaria,:inmueble_fecha_escritura,:inmueble_depto,:inmueble_ciudad,:construccion_numero_de_pisos,:construccion_numero_de_sotanos,:construccion_año_construcicon,:construccion_vetustez,:construccion_estado,:construccion_terminada,:construccion_en_obra,:construccion_avance,:construccion_usado_sin_terminar,:construccion_usado_terminado,:construccion_usado_remodelado,:construccion_esatdo_de_conservacion,:construccion_estructura_2,:construccion_estructura_1,:construccion_estructura_otro,:construccion_fachada,:construccion_fachada_otro,:construccion_cubierta,:construccion_cubierta_otro,:construccion_irregularidad_planta,:construccion_irregularidad_altura,:construccion_daños_previos,:construccion_reparados,:construccion_estructura_reforzada,:construccion_sala,:construccion_comedor,:construccion_estudio,:construccion_baño_social,:construccion_estar_hab,:construccion_baño_privado,:construccion_cocina,:construccion_cuarto_serv,:construccion_baño_servicio,:construccion_patio_interior,:construccion_terraza,:construccion_jardin,:construccion_balcon,:construccion_z_verde_privada,:construccion_iluminacion,:construccion_ventilacion,:construccion_total_garages,:construccion_cubierto,:construccion_servidumbre,:construccion_deposito,:construccion_local,:construccion_bodega,:construccion_oficina,:construccion_estado_pisos,:construccion_estado_techos,:construccion_estado_muros,:construccion_estado_c_mader,:construccion_estado_c_metal,:construccion_estado_baños,:construccion_estado_cocina,:construccion_calidad_pisos,:construccion_calidad_techos,:construccion_calidad_muros,:construccion_calidad_c_mader,:construccion_calidad_c_metal,:construccion_calidad_baños,:construccion_calidad_cocina,:construccion_propiedad_horizontal,:construccion_cojunto_o_agrupacion_cerrada,:construccion_ubicacion_inmueble,:construccion_numero_edificios_o_casas,:construccion_unid_por_piso,:construccion_total_unidades,:construccion_porteria,:construccion_citofono,:construccion_bicicletero,:construccion_piscina,:construccion_tanque_agua,:construccion_club_house,:construccion_gj_visitante,:construccion_juegos_niños,:construccion_cancha_multi,:construccion_bomba_eyectora,:construccion_a_acon_central,:construccion_cancha_squash,:construccion_z_verdes,:construccion_gimnasio,:construccion_golfito,:construccion_salon_comunal,:construccion_shut_basuras,:construccion_eq_presion_cons,:construccion_planta_electrica,:construccion_ascensor,:construccion_numero_ascensores,:construccion_otro_1,:construccion_otro_2,:oferta_actualidad_edificadora,:oferta_comportamiento_de_oferta_y_demanda,:oferta_tiempo_esperado_comercializacion,:ambiental_salubridad,:ambiental_arborizacion,:ambiental_parques,:ambiental_z_verdes,:ambiental_positivo_otro,:ambiental_por_aire,:ambiental_basura,:ambiental_inseguridad,:ambiental_ruido,:ambiental_aguas_servidas,:ambiental_negativo_otro,:avaluo_1,:avaluo_area_1,:avaluo_valor_1,:avaluo_2,:avaluo_area_2,:avaluo_valor_2,:avaluo_3,:avaluo_area_3,:avaluo_valor_3,:avaluo_4,:avaluo_area_4,:avaluo_valor_4,:avaluo_5,:avaluo_area_5,:avaluo_valor_5,:avaluo_6,:avaluo_area_6,:avaluo_valor_6,:avaluo_7,:avaluo_area_7,:avaluo_valor_7,:avaluo_8,:avaluo_area_8,:avaluo_valor_8,:avaluo_9,:avaluo_area_9,:avaluo_valor_9,:avaluo_10,:avaluo_area_10,:avaluo_valor_10,:observaciones_observaciones)
    end
end
