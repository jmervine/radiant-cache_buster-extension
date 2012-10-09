class CreateInitalCacheBuster < ActiveRecord::Migration
  def self.up
    CacheBuster.new.save!
  end
  
  def self.down
    CacheBuster.destroy_all
  end
end

