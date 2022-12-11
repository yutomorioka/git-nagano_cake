class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    @genre.save
    render :index
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
