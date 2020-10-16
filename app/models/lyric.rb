class Lyric < ApplicationRecord
    belongs_to :parts, :songs
    validates_presence_of :count
end
