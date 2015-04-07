class Log
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ip, type: String
  embedded_in :task
end
