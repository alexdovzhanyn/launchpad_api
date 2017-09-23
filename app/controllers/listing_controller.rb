class ListingController < ApplicationController

  # TODO: remove before publication
  def index_listings
    render json: Listing.all.to_json
  end

  # TODO
  def new_listing
  end

  def get_listing
    id = params[:id]
    listing = Listing.find_by_id(id)
    if listing
      render json: listing.to_json
    else
      render status: 204
    end
  end

  # TODO: authorization
  def edit_listing
    id = params[:id]
    listing = Listing.find_by_id(id)

    title = params[:title]
    description = params[:description]
    category = params[:category]

    render status: 204 and return unless listing

    listing.title = title if title
    listing.description = description if description
    listing.category = category if category
    listing.save

    render json: listing.to_json
  end

  # TODO: authorization
  def delete_listing
    id = params[:id]
    success = Listing.delete(id) == 1
    render status: (success ? 200 : 404)
  end
end
