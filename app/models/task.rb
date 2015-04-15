class Task < ActiveRecord::Base

	before_validation :generate_token
  belongs_to :channel

  validates_presence_of :name, :target_url

  def generate_token
  	self.token = SecureRandom.base64(20)
  end
end
