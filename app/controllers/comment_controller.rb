class CommentController < ApplicationController
  before_action :authenticate_user!

  def index
    listing = Listing.find_by_id(params[:listing_id])
    render status: :not_found and return unless listing
    render json: listing.comments.to_json
  end

  def get
    comment = Comment.find_by_id(params[:id])
    render status: :not_found and return unless comment
    render json: comment.to_json
  end

  def new
    render status: :bad_request and return unless params[:listing_id] && params[:content]
    render json: Comment.create(user_id: current_user.id,
                                listing_id: params[:listing_id],
                                content: params[:content]).to_json
  end

  def edit
    comment = Comment.find_by_id(params[:id])
    render status: :unauthorized and return unless current_user.id == comment&.user_id || current_user.moderator?
    render status: :not_found and return unless comment
    comment.content = params[:content] if params[:content]
    comment.save
    render json: comment.to_json
  end

  def delete
    comment = Comment.find_by_id(params[:id])
    render status: :unauthorized and return unless current_user.id == comment&.user_id || current_user.moderator?
    comment.destroy
    render status: :ok
  end
end
