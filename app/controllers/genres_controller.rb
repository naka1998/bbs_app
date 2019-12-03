class GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?

  def index
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def admin?
    current_user.is_admin
  end
end
