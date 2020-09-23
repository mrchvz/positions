class PositionsController < ApplicationController
  def index
    @positions = Position.all
    render :index
  end
end
