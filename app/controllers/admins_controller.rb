class AdminsController < ApplicationController
  before_action :set_admin, only: [:show,:destoy]
  before_action :authenticate_admin!, only: [:destroy,:create,:new,:index,:show,:create_requests,:requests,:create_pdf]

  def index
    @admins = Admin.load_admins(page: params[:page],per_page: params[:per_page])
  end

  def show

  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        NotificationMailer.password_admin(@admin.email,params[:admin][:password]).deliver_later
        format.html { redirect_to @admin, notice:  t('admins.created') }
        format.json { render json: @admin, status: :create }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_admin.id != @admin.id
        @admin.destroy
        format.html {redirect_to admins_path,notice: t("admins.destroyed")}
        format.json { head :no_content }
      else
        format.html {redirect_to admins_path,notice: t("admins.destroyed_error")}
        format.json {  head :no_content }
      end

    end

  end

  def create_requests
    @peritos =  User.peritos
    @clientes = Client.all
  end

  def create_pdf
    @avaluo = Avaluo.find_by_id(params[:avaluo])
    respond_to do |format|
      format.pdf do
          @users = AvaluoUser.where(avaluo_id: @avaluo.id)
          pdf = ReportPdf.new(@avaluo,@users)
          send_data pdf.render, filename: 'avaluos.pdf', type: 'application/pdf'
        end
    end
  end

  def requests
    nivel_one = {
      "1"=>"Inmueble",
      "2" =>"Mueble"
    }
    nivel_two = {
      "1" => {
        "1" => "Rural",
        "2" => "Urbano"
      }
    }
    nivel_three = {
      "1" => {
        "1" => "Casa rural",
        "2" => "Lote"
      },
      "2" => {
        "1" => "Apartamento",
        "2" => "Bodega",
        "3" => "Casa",
        "4" => "Local",
        "5" => "Lote urbano",
        "6" => "Oficina"
      }
    }
    n_1 = nivel_one[params[:nivel_one]]
    n_2 = nivel_two[params[:nivel_one]][params[:nivel_two]]
    n_3 = nivel_three[params[:nivel_two]][params[:nivel_three]]
    respond_to do |format|
        avaluo = Avaluo.new
        avaluo.client_id = Client.find_by_id(params[:clientes]).id
        avaluo.avaluo_type = Avaluo.avaluo_types["#{n_1}-#{n_2}-#{n_3}"]
        avaluo.estado_avaluo = 0
        avaluo.estado_revison = 0
        avaluo.inmueble_tipo = n_3
        avaluo.serial = SecureRandom.uuid
        avaluo.save

        user = User.find_by_id(params[:peritos])
        a = AvaluoUser.new
        a.user_id = user.id
        a.avaluo_id = avaluo.id
        a.save
        NotificationMailer.notification_avaluo(user.email,avaluo.serial).deliver_later
        format.html { redirect_to admins_path, notice: 'Hemos asignado el avaluo al perito'}
        format.json { head :no_content}
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :lastname, :email, :password, :password_confirmation, :username,:mobile)
  end

  def set_admin
    @admin = Admin.find_by_id(params[:id])
  end
end
