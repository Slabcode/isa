class AdminsController < ApplicationController
  before_action :set_admin, only: [:show,:destoy]
  before_action :authenticate_admin!, only: [:destroy,:create,:new,:index,:show]

  def index
    @admins = Admin.load_admins(page: params[:page],per_page: params[:per_page])
  end

  def show

  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_parms)
    respond_to do |format|
      if @admin.save
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

  private
  def admin_params
    params.require(:admin).permit(:name, :lastname, :emial, :password, :password_confirmation, :username,:mobile)
  end

  def set_admin
    @admin = Admin.find_by_id(params[:id])
  end
end
