source 'https://rubygems.org'

gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'spring',        group: :development
gem 'bower-rails'
gem 'resque', git: 'https://github.com/stitchfix/resque.git', branch: 'resque-redis-interface'
gem 'angular-rails-templates'
gem 'unicorn'
gem "foreman"

group :test, :development do
  gem "capybara"
  gem "selenium-webdriver"
  gem "teaspoon"
  gem "phantomjs"
  gem "dotenv-rails"
  gem "poltergeist"
end

group :production, :staging do
    gem "rails_12factor"
    gem "rails_stdout_logging"
    gem "rails_serve_static_assets"
end
