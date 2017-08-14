class StaticsController < ApplicationController
  before_action :authenticate_user!, only: [:requests]
  def index
  end

  def requests
    @in_ur_aps = InUrAp.where(
      id: InUrApUser.where(user_id: current_user.id)
    )
    @in_ru_crs = InRuCr.where(
      id: InRuCrUser.where(user_id: current_user.id)
    )
  end
end
