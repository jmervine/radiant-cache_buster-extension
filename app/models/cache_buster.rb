class CacheBuster < ActiveRecord::Base

  DEFAULT_TIMEOUT = 1.day

  before_save :ensure_updated_at

  def self.buster
    self.there_can_be_only_one

    if self.first.updated_at.to_i < Time.now.to_i-self.timeout
      buster = self.bust_buster
    else
      buster = self.last
    end

    "?#{buster.updated_at.to_i}"
  end

  def self.bust_buster
    if self.first.nil?
       self.new.save
    else
      self.first.save
    end
    self.first
  end

  def self.timeout
    (Radiant::Config['cache_buster.timeout'] ? Radiant::Config['cache_buster.timeout'].to_i : DEFAULT_TIMEOUT).to_i
  end

  private
  def self.there_can_be_only_one
    return self.new(:updated_at => Time.now).save if self.first.nil?

    unless self.first == self.last
      the_one = self.last
      self.destroy_all
      self.new(:updated_at => the_one.updated_at).save
    end
  end

  def ensure_updated_at
    self.updated_at = Time.now
  end

end
