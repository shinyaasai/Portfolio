class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @record = @comment.record
    if @comment.save
      respond_to :js
    else
      flash[:alert] = "コメントに失敗しました"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @record = @comment.record
    if @comment.destroy
      respond_to :js
    else
      flash.now[:alert] = "コメントの削除に失敗しました"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :record_id, :comment)
  end
end
