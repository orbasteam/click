class Task < ActiveRecord::Base

	after_create :generate_token
  belongs_to :channel
  validates :name, presence: true
  validates :target_url, presence: true

  def generate_token
  	self.token = SecureRandom.hex(15)
  	self.save
  end
end
