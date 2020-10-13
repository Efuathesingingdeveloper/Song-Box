class Song < ApplicationRecord
    has_many :lyrics
    has_many :parts, through: :lyrics

end
