class SilhouettesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @silhouette = Silhouette.find(params[:id])
  end
end

