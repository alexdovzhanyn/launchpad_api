class ListingController < ApplicationController
  before_action :authenticate_user!

  # TODO: remove before publication
  def index
    render json: Listing.all.to_json
  end

  # TODO
  def new
  end

  def get
    listing = Listing.find_by_id(params[:id])

    if listing
      render json: listing.to_json
    else
      render status: 204
    end
  end

  # TODO: authorization
  def edit
    listing = Listing.find_by_id(params[:id])

    render status: 204 and return unless listing

    title = params[:title]
    description = params[:description]
    category = params[:category]

    listing.title = title if title
    listing.description = description if description
    listing.category = category if category
    listing.save

    render json: listing.to_json
  end

  # TODO: authorization
  def delete
    listing = Listing.find_by_id(params[:id])

    render status: 204 and return unless listing

    render status: (listing.destroy ? 200 : 404)
  end

end
