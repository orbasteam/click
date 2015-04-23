class Task < ActiveRecord::Base

	before_create :generate_token
  belongs_to :channel

  validates_presence_of :name, :target_url

  def generate_token
  	self.token = SecureRandom.hex(20)
  end
end
