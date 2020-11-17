class Song < ApplicationRecord
    validates_presence_of :title
    belongs_to :user
    has_many :lyrics
    has_many :parts, through: :lyrics

    scope :search, -> (search) { where("LOWER(title) LIKE ?", "%#{search.downcase}%") }

  #   def self.search(search)
      
  #     self.where("title LIKE ?", "%#{search}%")
  # end 

  


end