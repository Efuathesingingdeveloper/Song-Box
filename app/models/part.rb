class Part < ApplicationRecord
    has_many :lyrics
    has_many :songs, through: :lyrics
end
