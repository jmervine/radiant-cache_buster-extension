# Cache Buster 

Simply adds a tag which applies to a cache buster to any asset.

## Usage

        <h1> Homepage </h1>
        <img src="http://example.com/some/external/image.jpg<r:cache_buster/>">

        <h1> Subpage </h1>
        <img src="http://example.com/some/external/image.jpg<r:cache_buster timeout="60" />">

## Configuration

        # file: :radiant_root/config/initializers/radiant_config.rb
        Radiant.config do |config|
                config['cache_buster.timeout'] = 1.day
        end


