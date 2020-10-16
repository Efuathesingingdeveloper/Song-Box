class LyricsController < ApplicationController

    def index
      get_songs
    end
  
  
    def new
       get_songs
       redirect_to songs_path if !@song
       @lyric = Lyric.new
    end
  
    def create
        @song= Song.find_by(id: params[:lyric][:song_id])
        @lyric = Lyric.new(lyric_params)
      if @lyric.save
        redirect_to song_lyrics_path(@lyric.song)
      else
        render :new
      end
    end
  
    def destroy
      
    end

    private
def get_songs
    @song = Song.find_by(id: params[:song_id])
end 

def lyric_params
    params.require(:lyric).permit(:part_id, :count, :genre, :song_id)
end