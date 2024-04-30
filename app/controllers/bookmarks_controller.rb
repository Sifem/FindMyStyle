class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: :destroy


  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def create
    @recommendation = Recommendation.find(params[:recommendation_id])
    @bookmark = Bookmark.new(user: current_user, recommendation: @recommendation)
    if @bookmark.save
      redirect_to request.referer, notice: "Bookmark created successfully!"
    else
      flash.now[:alert] = "Error creating bookmark"
      redirect_to request.referer, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to request.referer, notice: "Bookmark removed successfully!"
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:recommendation_id)
  end

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  end
end
