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
      params.require(:avaluo).permit(:nombre_solicitante, :tipo_de_identificacion, :numero_de_identificacion, :client_id, :objeto_avaluo, :fecha_avaluo, :fecha_correcion, :metodologia_valutoria, :estado_avaluo, :estado_revison, :barrio, :nombre_conjunto_o_edificio, :departamento, :ciudad, :sistemas_de_coordenadas, :latitud, :longitud, :sistemas_de_coordenadas_otra, :direccion_inmueble, :justificacion_metodologia, :avaluo_type, :inmueble_tipo, :inmueble_uso, :inmueble_uso_otro, :inmueble_clase, :inmueble_clase_otro, :inmueble_tipo_vivienda, :m_inmob_principal_1, :m_inmob_principal_2, :m_inmob_gj_1, :m_inmob_gj_2, :m_inmob_gj_3, :m_inmob_gj_4, :m_inmob_gj_5, :m_inmob_dp_1, :m_inmobiliaria_dp_2, :chip, :inmueble_ubicacion, :inmueble_num_escritura, :inmueble_num_notaria, :inmueble_fecha_escritura, :inmueble_depto, :inmueble_ciudad, :observaciones_observaciones)
    end
end
