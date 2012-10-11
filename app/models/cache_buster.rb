class CacheBuster < ActiveRecord::Base

  MASTER_BUSTER = "MASTER_CACHE_BUSTER".freeze
  DEFAULT_TIMEOUT   = (Radiant::Config['cache_buster.timeout'] ? Radiant::Config['cache_buster.timeout'] : 1.day).freeze

  validates_uniqueness_of :name
  before_filter :ensure_buster, :ensure_timeout

  def self.buster! name=MASTER_BUSTER, timeout=nil
    cache_buster = CacheBuster.find_or_create_by_name(name)
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
    self.buster = Time.now
  end

  private
  def ensure_buster
    buster = Time.now
  end

  def ensure_timeout
    timeout = DEFAULT_TIMEOUT unless timeout
  end
end

