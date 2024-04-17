class SilhouettesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @silhouettes = Silhouette.where(combined_silhouette: nil)
  end


  def show
    @silhouette = Silhouette.find(params[:id])
  end
end
