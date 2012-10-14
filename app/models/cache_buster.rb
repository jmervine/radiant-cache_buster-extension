class CacheBuster < ActiveRecord::Base

  validates_uniqueness_of :name

  def self.master_buster
    "MASTER_CACHE_BUSTER"
  end

  def self.default_timeout
    @@default_timeout ||= (Radiant::Config['cache_buster.default_timeout'] ? Radiant::Config['cache_buster.default_timeout'] : 1.day)
  end

  def buster!
    bust_buster if buster.to_i < Time.now.to_i-timeout
    "?#{buster.to_i}"
  end

  def bust_buster
    buster = Time.now
    save
  end

end
