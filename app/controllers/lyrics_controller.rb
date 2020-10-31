class LyricsController < ApplicationController
  before_action :require_login
  before_action :get_song, only: [:new , :show]



 
  def new
    get_song
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
  get_lyrics
redirect_to song_lyric_path if !@song
  end 

def edit
  get_song
  get_lyrics
 
end

def update
  get_song
  get_lyrics
  @lyric.update(lyric_params)
redirect_to song_lyric_path(@song, @lyric)
end


 private

 def get_song
  @song = Song.find_by(id: params[:song_id])
 end 

 def get_lyrics
  @lyric = Lyric.find(params[:id])
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
