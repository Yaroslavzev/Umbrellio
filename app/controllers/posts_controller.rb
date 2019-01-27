class PostsController < ApplicationController
  # POST /posts
  def create
    @post = PostService.run(post_params.to_h)
    @post.success? ? (render json: @post.response) : ( render json: @post.response, status: :unprocessable_entity)

    # Rails.logger.info @post.response.class
  end

  private

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :body, :ip, :user_id)
  end
end
