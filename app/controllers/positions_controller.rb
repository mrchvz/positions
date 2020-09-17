class PositionsController < ApplicationController
  def index
    @positions = Positions.all
    render :index
  end
end
