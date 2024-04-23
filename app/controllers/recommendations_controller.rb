class RecommendationsController < ApplicationController
  def index
    @silhouette = current_user.silhouettes.first
    @recommendations = @silhouette.recommendations
    @bookmarks = current_user.bookmarks.includes(:recommendation)
    # @transition_recommendation = @recomendations.where(transition: params[:query])
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end
end
