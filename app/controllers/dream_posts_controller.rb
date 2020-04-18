class DreamPostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @dream_post = current_user.dream_posts.build(dream_post_params)
    @record = @dream_post.record
    if @dream_post.save
      respond_to :js
    end


  end

  def destroy
    @dream_post = DreamPost.find_by(id: params[:id])
    @record = @dream_post.record
    if @dream_post.destroy
      respond_to :js
    end

  end

    private
      def dream_post_params
        params.permit(:record_id)
      end
end
