class TransitionsController < ApplicationController
  def show
    @transition = Transition.find(params[:id])
    @recommendations = @transition.recommendations
  end
end
