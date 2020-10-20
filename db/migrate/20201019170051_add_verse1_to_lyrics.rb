class AddVerse1ToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :verse1, :text
    add_column  :lyrics, :verse2, :text
    add_column  :lyrics, :verse3, :text
    add_column  :lyrics, :verse4, :text
    add_column  :lyrics, :hook,   :text
    add_column  :lyrics, :bridge, :text
    add_column  :lyrics, :notes, :text


  end
end
