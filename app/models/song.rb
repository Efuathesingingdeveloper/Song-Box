class Song < ApplicationRecord
    validates_presence_of :title
    belongs_to :user
    has_many :lyrics
    has_many :parts, through: :lyrics
    accepts_nested_attributes_for :lyrics
    scope :search, -> (query) { where(genre: 'R&B', "%#{query.downcase}%") }
    scope :search, -> (query) { where(genre: 'Rap', "%#{query.downcase}%") }
    scope :search, -> (query) { where(genre: 'Hip-Hop', "%#{query.downcase}%") }
    scope :search, -> (query) { where(genre: 'pop', "%#{query.downcase}%") }
    scope :search, -> (query) { where(genre: 'electronic', "%#{query.downcase}%") }
    scope :search, -> (query) { where(genre: 'singer Song Writer', "%#{query.downcase}%") }

end
