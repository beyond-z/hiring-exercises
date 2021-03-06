source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

gem 'pg'

group :development, :test do
  # Use Puma as the app server
  gem 'puma', '~> 3.11'
end

group :production do
  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.11.0'
  # rails specific capistrano funcitons
  gem 'capistrano-rails', '~> 1.4.0'
  # TODO: Helpers to run delayed jobs
  #gem 'capistrano3-delayed-job', '~> 1.4.0'
  # integrate bundler with capistrano
  gem 'capistrano-bundler'
  # Use Passenger Phusion app server on prod and staging servers
  gem 'capistrano-passenger'
  # Use RVM to manage Ruby versions
  gem 'capistrano-rvm'
  # Helps manage the delayed jobs worker process
  gem 'capistrano3-delayed-job', '~> 1.0'
  # Needed by delayed-job gem above
  gem 'daemons'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'capybara', '~> 2.18'
  gem 'selenium-webdriver', '~> 3.7'
  gem 'database_cleaner'
  gem 'dotenv'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  
  gem 'guard-rspec', require: false
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'valid_url', git: 'https://github.com/bellmyer/valid_url'
gem 'paranoia'
gem 'bulk_insert'

gem 'will_paginate'
gem 'delayed_job_active_record'

gem 'devise'
gem 'devise_cas_authenticatable'
gem 'safety_mailer'
gem 'aws-sdk-s3', require: false

gem 'split', require: 'split/dashboard'
gem 'rubyzip', '>= 1.2.2'
gem 'ffi', '>= 1.9.25'