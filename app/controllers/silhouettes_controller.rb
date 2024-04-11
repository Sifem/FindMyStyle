class SilhouettesController < ApplicationController
  def index
    @silhouettes = Silhouette.where(combined_silhouette: nil)
  end
end
