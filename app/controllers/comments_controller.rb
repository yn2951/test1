class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      if params[:url] == topics_url
        redirect_to topics_url, info: 'コメントに成功しました'
      else
        redirect_to favorites_index_url, info: 'コメントに成功しました'
      end
    else
      if params[:url] == topics_url
        redirect_to topics_url, info: 'コメントに失敗しました'
      else
        redirect_to favorites_index_url, info: 'コメントに失敗しました'
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end

end
