class MotelsController < ApplicationController

  def index
  	@motels = Motel.all.where(user: current_user)
  end

end
