source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'unicorn'
gem 'rack-raw-upload'

# debugging or other development
group :development do
  gem 'foreman'
  gem 'better_errors'
end

# database
gem 'pg'

# admin/cms
gem 'activeadmin'

# storage/upload
gem 'activeadmin-dragonfly', github: 'stefanoverna/activeadmin-dragonfly'
gem 'rack-cache', :require => 'rack/cache'
gem 'activeadmin-wysihtml5', github: 'stefanoverna/activeadmin-wysihtml5'
gem "paperclip", "~> 3.0"
gem 'aws-sdk', '~> 1.3.4'
gem "fog", "~> 1.3.1"

# asset compiling
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bourbon'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "asset_sync"
end

# asset generators
gem 'jquery-rails'
gem "rails-backbone"

# helpful tools

## debugging
gem 'awesome_print'

## environment management
gem 'figaro', github: 'laserlemon/figaro'

## link helpers
gem "friendly_id", "~> 4.0.9"
