class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    genre_id = params[:genre_id]
    if genre_id
      @topics = Topic.where(genre_id: genre_id)
    else
      @topics = Topic.all
    end
  end

  def show
    reply_post_id = params[:reply_post_id]
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.where(reply_post_id: nil)
    @post = @topic.posts.new(reply_post_id: reply_post_id)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    redirect_to root_path unless identify_user(@topic)
  end

  def update
    @topic = Topic.find(params[:id])
    redirect_to root_path unless identify_user(@topic)
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    redirect_to root_path unless identify_user(topic)
    topic.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :genre_id)
  end

  def identify_user(target)
    target.user == current_user || current_user.is_admin
  end
end
