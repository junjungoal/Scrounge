class WantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @wants = Want.all
  end

  def new
    @want = Want.new
  end

  def create
    @want = current_user.wants.new(want_params)
    if @want.save
      redirect_to wants_path
    else
      render :new
    end
  end

  private
  def want_params
    params.require(:want).permit(:title)
  end
end
