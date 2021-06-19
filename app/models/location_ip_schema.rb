class LocationIpSchema < ApplicationRecord
  belongs_to :location 
  validates :network, presence: true, 
  format: { with: /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i, message: "please enter network in correct format e.g 172.16.10.0"}
  validates :subnet, presence: true, 
  format: { with: /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i, message: "please enter subnet in correct format e.g 255.255.255.0"}

  def self.search_location(given_ip) 
    self.all.each do |ip_schema| 
      the_network = IPAddr.new("#{ip_schema.network}/#{ip_schema.subnet}")
      begin
      if the_network.include? "#{given_ip}" 
        return ip_schema.location
      end
      rescue IPAddr::InvalidAddressError
        return false
      end
    end
    return false
  end

end
