# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'annotate', '~> 2.7.4'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.3'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'
gem 'graphiql-rails', '1.5.0'
gem 'graphql', '1.8.13'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'httparty', '~> 0.16.4'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker', '~> 1.9.3'
  gem 'pry-byebug', '~> 3.3.0', platform: :mri
  gem 'rspec-core', '~> 3.5.2'
  gem 'rspec-rails', '~> 3.5.2'
end

group :development do
  gem 'brakeman', '~> 3.4.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_best_practices', '~> 1.19.4'
  gem 'reek', '~> 5.3.2'
  gem 'rubocop', '~> 0.67.2', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'json_matchers', '~> 0.11.0'
  gem 'rspec-graphql_matchers', '~> 0.7.1'
  gem 'simplecov', '~> 0.13.0', require: false
  gem 'shoulda-matchers', '~> 3.1.3'
  gem 'vcr', '~> 4.0.0'
  gem 'webmock', '~> 3.5.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
