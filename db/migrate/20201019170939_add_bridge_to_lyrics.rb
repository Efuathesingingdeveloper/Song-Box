class AddBridgeToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :bridge, :description
  end
end
