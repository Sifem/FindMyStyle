class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :find_my_style ]

  def home
  end

  def select_silhouette
    @silhouettes = Silhouette.all
  end

  def find_my_style
  end
end
