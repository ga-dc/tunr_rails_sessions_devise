class ArtistsController < ApplicationController
  def sort
    session[:sort_by] = params[:sort_by]
    redirect_to artists_path
  end

  # index
  def index
    @artists = Artist.all.order(session[:sort_by])
    @last_viewed_artist = Artist.find_by(id: session[:last_viewed_artist_id])
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
    session[:last_viewed_artist_id] = @artist.id
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

  def delete_session
  session.delete(:last_viewed_artist)
  # or reset_session
  # which resets the entire session hash
  redirect_to artists_path
end


  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end
