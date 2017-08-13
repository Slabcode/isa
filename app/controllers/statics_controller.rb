class StaticsController < ApplicationController
  before_action :authenticate_user!, only: [:requests]
  def index
  end

  def requests
  end
end
