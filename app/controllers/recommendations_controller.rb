class RecommendationsController < ApplicationController
  def index
    @silhouette = current_user.silhouettes.first
    @recommendations = @silhouette.recommendations
  end

end
