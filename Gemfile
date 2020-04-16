source 'https://rubygems.org'


gem 'rails', '~> 5.1.6'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'font-awesome-sass', '~> 5.4.1'
gem 'kaminari'
gem 'dotenv-rails'

group :production, :staging do
    gem 'unicorn', '5.4.1'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.25.0'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'webdrivers'
  gem 'launchy', '~> 2.4.3'
  gem "factory_bot_rails", "~> 4.10.0"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'pry-byebug'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
