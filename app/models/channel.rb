class Channel < ActiveRecord::Base
  validates :name, presence: true
  has_many :task
end
