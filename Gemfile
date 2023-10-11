source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'rubocop', '>= 1.0', '< 2.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails', '~> 6.0'
  gem 'rspec-rails'
  gem 'webdrivers'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end
