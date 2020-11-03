class LyricsController < ApplicationController
  before_action :require_login
  before_action :get_song, only: [:new , :show]



 
 def new
    get_song
      @lyric = Lyric.new
  end
  
    
  def create
      @song = Song.find_by(id: params[:lyric][:song_id])
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


def lyric_params
    params.require(:lyric).permit( :id, :song_id, :part_id, :count, :lyrics )
  end
end
