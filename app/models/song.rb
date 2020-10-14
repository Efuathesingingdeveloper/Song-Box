class Song < ApplicationRecord
    validates_presense_of :title
    has_many :lyrics
    has_many :parts, through: :lyrics

end
