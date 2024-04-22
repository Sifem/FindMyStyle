class UserSilhouettesController < ApplicationController

  def create
    if UserSilhouette.where("user_id = #{current_user.id}").empty?
      @silhouette = Silhouette.find(params["user_silhouette"]["silhouette_id"])
      @user_silhouette = UserSilhouette.new(user: current_user, silhouette: @silhouette)
      @user_silhouette.save
      redirect_to silhouette_path(@silhouette)
    else
      redirect_to select_silhouette_path
      flash.alert = "Silhoette already assigned to user"
    end
  end
end
