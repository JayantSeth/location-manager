class LocationType < ApplicationRecord
  has_many :location
  validates :location_type, presence: true,  uniqueness: {case_sensitive: false}, 
                             length: {minimum: 2, maximum: 25} 
end
