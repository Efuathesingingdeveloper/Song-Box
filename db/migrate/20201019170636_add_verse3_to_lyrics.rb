class AddVerse3ToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :verse3, :description
   
  end
end
