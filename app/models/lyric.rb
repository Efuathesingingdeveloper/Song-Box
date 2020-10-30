class Lyric < ApplicationRecord
    belongs_to  :song, optional: true
    belongs_to  :part 
end
