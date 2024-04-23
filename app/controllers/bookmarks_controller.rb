class BookmarksController < ApplicationController
  before_action :authenticate_user!


  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    @bookmark = Bookmark.new
  end


  def create
    @bookmark = Bookmark.new(user_id: params[:user_id], recommendation_id: params[:recommendation])
    if @bookmark.save
      redirect_to user_bookmarks_path(current_user), notice: "Bookmark created successfully!"
    else
      flash.now[:alert] = "Error creating bookmark"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to root_path, notice: "Bookmark removed successfully!"
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:recommendation_id)
  end

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  end
end
