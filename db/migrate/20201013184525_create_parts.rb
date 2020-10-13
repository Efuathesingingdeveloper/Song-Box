class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :type
      t.text :verse
      t.text :chorus
      t.text :bridge 
  

      t.timestamps
    end
  end
end
