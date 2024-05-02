class SilhouettesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @silhouettes = Silhouette.where(combined_silhouette: nil).with_attached_photo
  end

  def show
    @silhouette = Silhouette.find(params[:id])
  end

end
