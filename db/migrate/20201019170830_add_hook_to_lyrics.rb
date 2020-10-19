class AddHookToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column  :lyrics, :hook, :description

  end
end
