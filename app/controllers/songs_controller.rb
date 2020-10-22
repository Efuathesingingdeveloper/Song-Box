class SongsController < ApplicationController
  before_action :require_login

  def index
    @songs = current_user.songs
  end

  def show
    find_song
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
    @song = current_user.songs.build(song_params)
   
    flag = @song.save
     if flag
      redirect_to new_song_lyric_path(@song)
    else
      render :new
  end
end

  def edit
    find_song
  end

  def search
    @songs = Song.search(params[:search])

    render :index
end

  def update
    find_song
    @song.update(song_params)
    if @song.errors.empty?
      redirect_to @song
    else
      flash[:notice] = @song.errors.full_messages.join(" ")
      redirect_to edit_song_path(@song)
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
  def find_song 
    @song = Song.find_by(id: params[:id])
  end 
  def song_params
    params.require(:song).permit(:title, :genre, :user_id, :id)
end
end