class Location < ApplicationRecord
  belongs_to :location_type 
  validates :location_name, presence: true, uniqueness: {case_sensitive: false}, 
                            length: {minimum: 2, maximum: 25}
end
