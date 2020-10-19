class AddVerse2ToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :verse2, :description
   
  end
end
