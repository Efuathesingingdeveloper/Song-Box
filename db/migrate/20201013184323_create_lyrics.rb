class CreateLyrics < ActiveRecord::Migration[6.0]
  def change
    create_table :lyrics do |t|
      t.string :song_id
      t.string :part_id
      t.integer :count

      t.timestamps
    end
  end
end
