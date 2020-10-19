class AddVerse4ToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :verse4, :description
    
  end
end
