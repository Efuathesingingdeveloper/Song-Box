class PartsController < ApplicationController

    
        def index
        @parts = parts.all
        end
      
      
        def new
            render :new
        end
      
        def create
            @parts = Song.find_by(id: params[:part][:song_id])
            @parts = Part.new(part_params)
          if @parts.save
            redirect_to song_parts_path(@parts.song)
          else
            render :new
          end
        end
      
        def update
            @song = Song.find_by(id: params[:lyric][:id])
            @parts.update(parts_params)
              redirect_to edit_parts_path(@parts.song)
          end
        
          def destroy
            @parts = parts.find_by(id: params[:lyric][:id])
            if @parts.destroy
              redirect_to lyric_path
            else
              flash[:notice] = "Was unable to delete part!"
              redirect_to @song
            end
        end
            private
              def parts_params
                params.require(:parts).permit(:part_id, :count, :genre, :song_id)
            end