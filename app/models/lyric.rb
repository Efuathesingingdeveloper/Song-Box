class Lyric < ApplicationRecord
    belongs_to :songs, optional: true
    
    
end
