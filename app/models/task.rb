class Task < ActiveRecord::Base
  belongs_to :channel
  validates :name, presence: true
  validates :target_url, presence: true
end
