class SongsController < ApplicationController
    def index
        @songs = Song.all
        
    end

    def show
 @song = Song.find_by(id: params[:id])

 if @song
 render :show
 else
    redirect_to songs_path, :notice => "song not found " 
end
 end 

    end
end
