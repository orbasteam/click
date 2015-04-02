class Task

	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :channel_id, type: Integer
	field :target_url, type: String
	field :description, type: String
	field :token, type: String

	after_create :generate_token
  belongs_to :channel
  validates :name, presence: true
  validates :target_url, presence: true

  def generate_token
  	self.token = SecureRandom.hex(15)
  	self.save
  end
end
