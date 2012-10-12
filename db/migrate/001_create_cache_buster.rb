class CreateCacheBuster < ActiveRecord::Migration
  def self.up
    create_table :cache_busters, :force => true do |t|
      t.string    :name, :null => false
      t.datetime  :buster, :null => false
      t.integer   :timeout, :default => 1.day, :null => false
    end
  end
  
  def self.down
    drop_table :cache_busters
  end
end
