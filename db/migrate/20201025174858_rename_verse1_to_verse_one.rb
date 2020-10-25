class RenameVerse1ToVerseOne < ActiveRecord::Migration[6.0]
  def change
    rename_column :lyrics, :verse1, :verse_one
  end
end
