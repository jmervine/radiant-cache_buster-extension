class AddFieldsToCacheBuster < ActiveRecord::Migration
  def self.up
    # drop and create for oracle support
    drop_table :cache_busters

    create_table :cache_busters, :force => true do |t|
      t.string   :name, :null => false
      t.datetime :buster, :null => false
      t.integer  :timeout, :default => 1.day.to_i, :null => false
    end

  end
  
  def self.down
    # drop and create for oracle support
    drop_table :cache_busters

    create_table :cache_busters, :force => true do |t|
      t.datetime :updated_at, :null => false
    end
  end
end
