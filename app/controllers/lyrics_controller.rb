class LyricsController < ApplicationController
  before_action :require_login
  before_action :validate_song


  def index
    get_song
    
    end
  end 
    def new
       get_song
       @lyric = Lyric.new
    end
  
    def create
        @song = Song.find_by(id: params[:lyric][:song_id])
        @lyric = Lyric.new(lyric_params)
      if @lyric.save
        redirect_to song_lyrics_path(@lyric.song)
      else
        render :new
      end
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


 private
def get_song
    @song = Song.find_by(id: params[:song_id])
end 

def validate_song
  redirect_to songs_path  unless get_song 
end 

def lyric_params
    params.require(:lyric).permit(:part_id, :count, :genre, :song_id)
end