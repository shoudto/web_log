require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# use Rack::Flash
use Rack::MethodOverride
use SessionsController 
use UsersController
use BlogsController
run ApplicationController
