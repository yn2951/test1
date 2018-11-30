class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
    @favorites = Favorite.all
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りの登録に失敗しました'
    end
  end

  def destroy
    Favorite.find_by(topic_id: params[:topic_id], user_id: params[:user_id]).delete

    if params[:url] == topics_url
      redirect_to topics_url, info: 'お気に入りから削除しました'
    else
      redirect_to favorites_index_url, info: 'お気に入りから削除しました'
    end
  end
end
