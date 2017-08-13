class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index,:destroy]
  before_action :authenticate, only: [:show]
  before_action :set_user, only: [:show,:destroy]

  def index
    @users = User.load_users(page: params[:page],per_page: params[:per_page])
  end

  def show
  end

  def destroy
    respond_to do |format|
        @user.destroy
        format.html {redirect_to users_path,notice: t("admins.destroyed")}
        format.json { head :no_content }
    end
  end

  private
  def set_user
    @user =  User.find_by_id(params[:id])
  end
end
