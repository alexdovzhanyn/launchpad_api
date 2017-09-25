class ListingController < ApplicationController
  # TODO: re-enable once we have user auth set up with tokens
  # before_action :authenticate_user!

  # TODO: remove before publication
  def index
    render json: Listing.all.to_json
  end

  # TODO
  def new
  end

  def get
    id = params[:id]
    listing = Listing.find_by_id(id)
    if listing
      render json: listing.to_json
    else
      render status: 204
    end
  end

  # TODO: authorization
  def edit
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
  def delete
    id = params[:id]
    success = Listing.delete(id) == 1
    render status: (success ? 200 : 404)
  end
end
