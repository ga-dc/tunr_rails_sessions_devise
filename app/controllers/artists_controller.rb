class ArtistsController < ApplicationController
  # index
  def testing_session
    session[:test] = "bob"
  end
  def index
    @artist = session[:last_viewed_artist]
    @artists = Artist.all
  end
  def deleting_session
    session.delete(:test)
  end

  # new
  def new
    @artist = Artist.new
  end

  # create
  def create
    @artist = Artist.create!(artist_params)
    redirect_to (artist_path(@artist))
  end

  #show
  def show
    @artist = Artist.find(params[:id])
    session[:last_viewed_artist] = @artist
  end

  # edit
  def edit
    @artist = Artist.find(params[:id])
  end


  # update
  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  # destroy
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end
