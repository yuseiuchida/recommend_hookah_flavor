class BookmarksController < ApplicationController
  def create
    flavor = Flavor.find(params[:flavor_id])
    current_user.bookmark(flavor)
    redirect_back fallback_location: root_path
  end

  def destroy
    flavor = current_user.bookmarks.find(params[:id]).flavor
    current_user.unbookmark(flavor)
    redirect_back fallback_location: root_path
  end
end
