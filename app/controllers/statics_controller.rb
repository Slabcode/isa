class StaticsController < ApplicationController
  before_action :authenticate, only: [:requests]
  def index
  end

  def requests
    if current_user
      ids = AvaluoUser.where(
        user_id: current_user.id
      ).pluck(:avaluo_id)
      @avaluos = Avaluo.where(
        id: ids
      )
      if current_user.Perito?
        @avaluos = @avaluos.where(estado_avaluo: [0,1])
      else
        @avaluos = @avaluos.where(estado_avaluo: [2])
      end
    else
      @avaluos = Avaluo.where(estado_avaluo: 3)
    end

  end
end
