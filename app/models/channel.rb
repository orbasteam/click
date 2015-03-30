class Channel < ActiveRecord::Base
	validates :name, presence: true
end
