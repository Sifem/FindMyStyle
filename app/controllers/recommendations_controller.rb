class RecommendationsController < ApplicationController
  def index
    @silhouette = current_user.silhouettes.first
    @recommendations = @silhouette.recommendations
    # @transition_recommendation = @recomendations.where(transition: params[:query])
  end

end
