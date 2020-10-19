class AddNotesToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :notes, :description

  end
end
