class LocationContact < ApplicationRecord
  belongs_to :location 
  validates :name, presence: true,  uniqueness: {case_sensitive: false}, 
  length: {minimum: 2, maximum: 25} 
  validates :number, presence: true, length: {minimum: 6, maximum: 30}
  validates :email, presence: true
end
