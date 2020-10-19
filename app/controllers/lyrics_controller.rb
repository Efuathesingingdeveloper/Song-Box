class LyricsController < ApplicationController
  before_action :require_login
  # before_action :get_song, only: [:index, :new]


  def index
    get_song
    redirect_if_request_invalid
  end 

    def new
         get_song
    end
  
    def create
        @song = Song.find_by(id: params[:lyric][:song_id])
        if user_authorized?
        @lyric = Lyric.new(lyric_params)
      if @lyric.save
        redirect_to song_lyrics_path(@lyric.song)
      else
        render :new
      end
    else
      redirect_to songs_path
    end
  end 


    def show
    
      @part = Part.find_by_id(params[:part_id])
      @lyric = Lyric.find(params[:id])
  end

  def edit
    @lyric = lyric.find(params[:song_id])
    @part = Part.find_by_id(params[:part_id])
end

  
    def update
        @song = Song.find_by(id: params[:lyric][:id])
        @lyric.update(song_params)
          redirect_to edit_lyrics_path(@lyric.song)
      end
    
      def destroy
        @lyric = Lyric.find_by(id: params[:lyric][:id])
        if @lyric.destroy
          redirect_to song_path
        else
          flash[:notice] = "Was unable to delete lyrics!"
          redirect_to @song
        end
      end 
    end
 private

def get_song
    @song  = Song.find_by(id: params[:song_id])
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
    params.require(:lyric).permit(:part_id, :count, :genre, :song_id)
end