class LyricsController < ApplicationController

    def index
        @song = Song.find_by(id: params[:song_id])
    end
  
  
    def new
     
    end
  
    def create
      
    end
  
    def destroy
      
    end
