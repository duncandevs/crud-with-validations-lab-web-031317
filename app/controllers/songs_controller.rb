class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    #DONT FORGET TO CHANGE THE RELEASED VALIDATE BOOLEAN
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year,:released, :genre)
  end

end
# SongsController
#   basic listing, viewing and editing
#     lists all songs (FAILED - 1)
#     views a single song (FAILED - 2)
#     fetches a song for editing (FAILED - 3)
#   creating a valid song
#     creates a new Song (FAILED - 4)
#     assigns and persists new song (FAILED - 5)
#     redirects to the created song (FAILED - 6)
#   creating an invalid song
#     has not been persisted (FAILED - 7)
#     re-renders the template (FAILED - 8)
#   updating a song with valid data
#     updates the song (FAILED - 9)
#     redirects to the song (FAILED - 10)
#   updating a song with invalid data
#     does not persist changes (FAILED - 11)
#     re-renders the 'edit' template (FAILED - 12)
#   destroying a song
#     destroys the requested song (FAILED - 13)
#     redirects to the songs list (FAILED - 14)
