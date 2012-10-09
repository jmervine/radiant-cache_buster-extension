class CreateCacheBuster < ActiveRecord::Migration
  def self.up
    create_table :cache_busters, :force => false do |t|
      t.datetime :updated_at, :null => false
    end
    
  end
  
  def self.down
    drop_table :cache_busters
  end
end
