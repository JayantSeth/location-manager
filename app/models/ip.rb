class Ip
  include ActiveModel::Validations
  attr_reader :ip 

  def initialize(ip=nil)
    @ip = ip
  end

  validates :ip, presence: true, 
  format: { with: /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i, message: "please enter a valid ip address"}
end
