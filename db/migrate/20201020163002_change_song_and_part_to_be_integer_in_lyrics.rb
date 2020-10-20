class ChangeSongAndPartToBeIntegerInLyrics < ActiveRecord::Migration[6.0]
  def change
    change_column :lyrics, :part_id, :integer
    change_column :lyrics, :song_id, :integer

  end
end
