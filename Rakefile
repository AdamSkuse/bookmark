require 'data_mapper'
require './app'

namespace :db do
	desc 'Upgrade: Non destructive'
	task :auto_upgrade do
     DataMapper.auto_upgrade!
     puts "Auto-upgrade complete (no data loss)"
  end

	desc 'Upgrade: Destructive'
	task :auto_migrate do
     DataMapper.auto_migrate!
     puts "Auto-migrate complete (data was lost)"
  end
end