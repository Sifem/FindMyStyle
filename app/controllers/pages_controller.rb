class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def select_silhouette
    @silhouettes = Silhouette.all


 




  end

end
