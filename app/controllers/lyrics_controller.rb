class LyricsController < ApplicationController
  before_action :require_login
  before_action :get_song, only: [:new , :show]



 
  def new
   
    @song = Song.find_by(id: params[:song_id])
    # redirect_if_request_invalid
      @lyric = Lyric.new
    end
  
  
def create
    @song = Song.find_by(id: params[:lyric][:song_id])
    # if user_authorized?
      @lyric = Lyric.new(lyric_params)
  
    if @lyric.save
   
      redirect_to song_lyric_path(@song, @lyric)
    else
      render :new
    end 
end 


  def show 
  get_song
  @lyric = Lyric.find(params[:id])
redirect_to song_lyric_path if !@song
  end 

def edit
  @song = Song.find(params[:song_id])
  @lyric = Lyric.find(params[:id])
 
end

def update
  @song = Song.find(params[:song_id])
  @lyric = Lyric.find(params[:id])
  @lyric.update(lyric_params)
redirect_to song_lyric_path(@song, @lyric)
end

def destroy
end
    

 private

 def get_song
  @song = Song.find_by(id: params[:song_id])

 end 


def redirect_if_request_invalid
  
  if @song.nil? || !user_authorized?(@song)
    redirect_to songs_path
  end 
end

def lyric_params
    params.require(:lyric).permit( :id, :song_id, :part_id, :count, :lyrics )
  end
end
