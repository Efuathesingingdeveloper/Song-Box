class PartsController < ApplicationController

    
  def index
      
    end
        
        
        
  def create     
  render :index   
  end
        
    private
  def parts_params
    params.require(:parts).permit(:part_id, :count, :genre, :song_id)
  end
end