class AddVerse1ToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :verse1, :description

  end
end
