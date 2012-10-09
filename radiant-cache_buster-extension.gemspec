# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-cache_buster-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-cache_buster-extension"
  s.platform    = Gem::Platform::RUBY

  s.version     = RadiantCacheBusterExtension::VERSION
  s.authors     = RadiantCacheBusterExtension::AUTHORS
  s.email       = RadiantCacheBusterExtension::EMAIL
  s.homepage    = RadiantCacheBusterExtension::URL
  s.summary     = RadiantCacheBusterExtension::SUMMARY
  s.description = RadiantCacheBusterExtension::DESCRIPTION

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['spec/**/*'] - ignores
  s.require_paths = ["lib"]
end

