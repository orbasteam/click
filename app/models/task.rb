class Task < ActiveRecord::Base

	before_create :generate_token
  belongs_to :channel

  validates_presence_of :name, :target_url

  def generate_token
  	self.token = SecureRandom.hex(20)
  end

  def self.filter_channel(channel_id)
  	self.where(channel_id: channel_id)
  end
end
