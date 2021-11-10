# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'pagy', '~> 4.11.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'dry-rails', '~> 0.3.0'
gem 'dry-transformer'
gem 'title'
gem 'view_component', require: 'view_component/engine'

gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'fabrication'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'cuprite'
  gem 'site_prism', '~> 3.7.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
