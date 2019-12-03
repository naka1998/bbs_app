class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to topic_path(@post.topic)
    else
      @posts = @topic.posts.all
      render "topics/show"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if identify_user(post)
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:reply_post_id, :body)
  end

  def identify_user(target)
    target.user == current_user || current_user.is_admin
  end
end
