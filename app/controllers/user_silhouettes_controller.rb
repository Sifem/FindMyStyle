class UserSilhouettesController < ApplicationController

  def create
    if user_signed_in?
      @silhouette = Silhouette.find(params[:id])
      @user_silhouette = UserSilhouette.new(user: current_user, silhouette: @silhouette)
      if @user_silhouette.save
        redirect_to silhouette_path(@silhouette)
      else
        redirect_to select_silhouette_path
        flash.alert = "Silhoette already assigned to user"
      end
    else
      redirect_to select_silhouette_path
      flash.alert = "Must be sign in to choose silhouette"
    end
  end
end
