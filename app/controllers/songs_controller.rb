class SongsController < ApplicationController
def index
    @songs = Song.all
  end

  def show
    @song= Song.find_by(id: params[:id])
    if @song
      render :show
    else
      flash[:notice] = "Song not Found!"
      redirect_to songs_path
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    # @song = Song.create(song_params)

    if @song.save
      # redirect_to song_path(@song)
      redirect_to @song
    else
      flash[:notice] = @song.errors.full_messages.join(" ")
      redirect_to songs_new_path
    end
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(song_params)
    if @song.errors.empty?
      redirect_to @song
    else
      flash[:notice] = @song.errors.full_messages.join(" ")
      redirect_to edit_sushi_path(@song)
    end
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    if @song.destroy
      redirect_to song_path
    else
      flash[:notice] = "Was unable to delete song!"
      redirect_to @song
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end