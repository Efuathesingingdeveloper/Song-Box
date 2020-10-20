class LyricsController < ApplicationController
  before_action :require_login
  before_action :get_song, only: [:index, :new, :create]


  def index
    @song = Song.find_by_id(params[:lyric][:song_id].to_i)
    byebug
    redirect_if_request_invalid
  end 
  
  def new
      redirect_if_request_invalid
      @lyric = Lyric.new
    end
  
    def create
      @song = Song.find_by_id(params[:lyric][:song_id].to_i)
      redirect_if_request_invalid
    #   @lyric = Lyric.new
    #   byebug

      if user_authorized?(@song)
        @lyric = @song.lyrics.build(lyric_params)
        
         byebug
      if @lyric.save!
        # redirect_to song_lyric_path(@song, @lyric)
        render :show
      else
        render :new
      end
      else
      redirect_to songs_path
      end
  end 

  def show 
    render :show
  end 
def edit
end 
def update 
end 
def delete 
end 

    
 private

def get_song
    @song  ||= Song.find_by(id: params[:song_id])
end 

def user_authorized?(song)
  byebug
return (song.user_id == current_user.id.to_s)

end 

def redirect_if_request_invalid
  byebug
  if @song.nil? || !user_authorized?(@song)
    redirect_to songs_path
  end 
end

def lyric_params
    params.require(:lyric).permit( :id, :song_id, :part_id, :count, :verse1, :verse2, :verse3, :verse4, :hook, :bridge, :notes, )
end
end 