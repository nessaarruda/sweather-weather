source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'faraday'
gem 'mini_racer'
gem 'figaro'
gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'fast_jsonapi'
gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry'
  gem 'travis'
  gem 'factory_bot_rails'
  gem 'orderly'
  gem 'capybara'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'nyan-cat-formatter'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'launchy'
  gem 'webmock'
  gem 'vcr'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
