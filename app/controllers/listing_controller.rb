class ListingController < ApplicationController
  def new_listing;
  end

  def get_listing
    listing = Listing.find_by_id(params[:id])
    if listing
      render json: listing.to_json
    else
      render status: 404
    end
  end

  def edit_listing;
  end

  def delete_listing;
  end
end
