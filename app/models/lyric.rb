class Lyric < ApplicationRecord
    belongs_to :songs
    validates_presence_of :count
    
    def people
        Lyric.all.each do |lyric|
          lyric.count
        end
      end

end
