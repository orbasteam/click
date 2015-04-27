Time.class_eval do
  def self.minute_idx(time = Time.now)
    time.to_i / 60
  end

  def minute_idx
    self.class.minute_idx(self)
  end
end
