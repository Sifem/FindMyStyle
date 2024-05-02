class PagesController < ApplicationController
  require "openai"
  skip_before_action :authenticate_user!, only: [:home, :find_my_style ]
  def home
  end

  def select_silhouette
    @silhouettes = Silhouette.where(combined_silhouette: nil).with_attached_photo
    @user_silhouette = UserSilhouette.new
  end

  def find_my_style
  end

  def new
    @message = Message.new
  end

  def style_profile
    if current_user.silhouettes.count >= 1
      @recommendations = current_user.silhouettes.first.recommendations
    else
      flash.alert = "Must pick silhouette before going to profile page"
      redirect_to select_silhouette_path
    end
  end

  def style_transition
    @silhouette = current_user.silhouettes.first
    @transitions = @silhouette.transitions
  end
end
