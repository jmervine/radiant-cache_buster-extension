class CacheBuster < ActiveRecord::Base

  MASTER_BUSTER   = "MASTER_CACHE_BUSTER"
  DEFAULT_TIMEOUT = (Radiant::Config['cache_buster.timeout'] ? Radiant::Config['cache_buster.timeout'] : 1.day)

  validates_uniqueness_of :name
  before_save :ensure_buster, :ensure_timeout

  def self.buster! name=MASTER_BUSTER, timeout=nil
    cache_buster = self.find_or_create_by_name(name)
    if timeout and cache_buster.timeout.nil?
      cache_buster.timeout = timeout
    end
    cache_buster.buster!
  end

  def buster!
    bust_buster if buster.to_i < Time.now.to_i-timeout
    "?#{buster.to_i}"
  end

  def bust_buster
    buster = Time.now
    save
  end

  private
  def ensure_buster
    buster = Time.now unless buster
  end

  def ensure_timeout
    timeout = DEFAULT_TIMEOUT unless timeout
  end
end
