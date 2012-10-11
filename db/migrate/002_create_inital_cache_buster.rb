class CreateInitalCacheBuster < ActiveRecord::Migration
  def self.up
    CacheBuster.new(:name => CacheBuster::MASTER_BUSTER).save!
  end
  
  def self.down
    CacheBuster.destroy_all
  end
end
