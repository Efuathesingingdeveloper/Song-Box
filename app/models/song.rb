class Song < ApplicationRecord
    validates_presense_of :title
    has_many :lyrics
    has_many :parts, through: :lyrics
    acepts_nested_atttibutes_for :lyrics
    scope :search, -> (query) { where("LOWER(title) LIKE ?", "%#{query.downcase}%") }
    
    def formated_time
        self.created_at.strftime("%a, %e %b %Y %H:%M")
      end
end
