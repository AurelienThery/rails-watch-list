class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create ]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path(@lists)
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
