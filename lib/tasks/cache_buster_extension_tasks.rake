namespace :radiant do
  namespace :extensions do
    namespace :cache_buster do
      
      desc "Runs the migration of the CacheBuster extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          CacheBusterExtension.migrator.migrate(ENV["VERSION"].to_i)
          Rake::Task['db:schema:dump'].invoke
        else
          CacheBusterExtension.migrator.migrate
          Rake::Task['db:schema:dump'].invoke
        end
      end

    end
  end
end
