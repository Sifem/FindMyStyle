class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :find_my_style ]

  def home
  end

  def select_silhouette
    @silhouettes = Silhouette.where(combined_silhouette: nil)
    @user_silhouette = UserSilhouette.new
  end

  def find_my_style
  end

  def style_profile
    @recommendations = current_user.silhouettes.first.recommendations
  end

  def style_transition
    @silhouette = current_user.silhouettes.first
    @transitions = @silhouette.transitions
  end
end
