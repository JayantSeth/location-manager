class Location < ApplicationRecord
  belongs_to :location_type 
  has_many :location_ip_schema, dependent: :destroy
  has_many :location_contact, dependent: :destroy
  validates :location_name, presence: true, uniqueness: {case_sensitive: false}, 
                            length: {minimum: 2, maximum: 25}
end
