class LyricsController < ApplicationController
  before_action :require_login
  before_action :get_song, only: [:index, :new]


  def index
    redirect_if_request_invalid
  end 

    def new
      redirect_if_request_invalid
      @lyric = Lyric.new
    end
  
    def create
      @song = Song.find_by_id(params[:song_id])
      @lyric = Lyric.new
      # byebug
        # if user_authorized?
        # @lyric = @song.lyrics.build(lyric_params)
        if @lyric.save
        redirect_to song_lyric_path(@song, @lyric)
      else
        render :new
      end
    # else
    #   redirect_to songs_path
    # # end
  end 


    
 private

def get_song
    @song  ||= Song.find_by(id: params[:song_id])
end 

def user_authorized?
 @song.user && (@song.user.id == current_user.id)
end 

def redirect_if_request_invalid
  if @song.nil? || !user_authorized?
    redirect_to songs_path
  end 
end

def lyric_params
    params.require(:lyric).permit(:count, :verse1, :verse2, :verse3, :verse4, :hook, :bridge, :notes, :song_id)
end
end 