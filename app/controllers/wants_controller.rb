class WantsController < ApplicationController
  before_action :authenticate_user!
  include SearchableController

  def index
    @wants = Want.all
  end

  def search
    @wants = Want.search_wants_by_amazon(params[:keyword]) if params[:keyword].present?
    render :increment_search if params[:type].present?
  end

  def create
    @want = current_user.wants.new(want_params)
    if @want.save
      redirect_to wants_path
    else
      render :new
    end
  end

  def show
  end

  def new
  end

  private
  def want_params
    params.require(:want).permit(:title)
  end
end
