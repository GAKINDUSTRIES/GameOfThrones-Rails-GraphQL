# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker', '~> 1.7.3'
  gem 'pry-byebug', '~> 3.3.0', platform: :mri
  gem 'rspec-core', '~> 3.5.2'
  gem 'rspec-rails', '~> 3.5.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'simplecov', '~> 0.13.0', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
