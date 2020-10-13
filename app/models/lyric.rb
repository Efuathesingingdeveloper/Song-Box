class Lyric < ApplicationRecord
    belongs_to :parts, :songs
end
