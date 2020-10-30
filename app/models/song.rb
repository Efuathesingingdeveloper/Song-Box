class Song < ApplicationRecord
    validates_presence_of :title
    belongs_to :user
    has_many :lyrics
    has_many :parts, through: :lyrics


 

    # accepts_nested_attributes_for :lyrics
    scope :search, -> (query) { where("LOWER(name) LIKE ?", "%#{query.downcase}%") }

    def self.search(search)
      
      self.where("title LIKE ?", "%#{search}%")
  end 
end