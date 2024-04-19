class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :find_my_style ]

  def home
  end

  def select_silhouette
    @silhouettes = Silhouette.where(combined_silhouette: nil)
  end

  def find_my_style
  end

  def style_profile
    @recommendations = current_user.silhouettes.first.recommendations
  end
end
