class Ip
  include ActiveModel::Validations
  attr_reader :ip 

  def initialize(ip=nil)
    @ip = ip
  end

  validates :ip, presence: true, 
  format: { with: /\A(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\z/i, message: "please enter a valid ip address"}
end
