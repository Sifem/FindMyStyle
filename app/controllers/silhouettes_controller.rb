class SilhouettesController < ApplicationController

  def index
    @silhouettes = Silhouette.where(combined_silhouette: nil)
  end
end

  skip_before_action :authenticate_user!, only: [:show]

  def show
    @silhouette = Silhouette.find(params[:id])
  end
end


