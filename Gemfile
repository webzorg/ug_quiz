source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.0.0"
# Use postgresql as the database for Active Record
gem "pg", "~> 0.18"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "haml-rails", "~> 0.9"
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use jquery as the JavaScript library
gem "jquery-rails"
# Pagination
gem "kaminari"
# API
gem "active_model_serializers", "~> 0.10.0"
# I18n
gem "rails-i18n", github: "svenfuchs/rails-i18n", branch: "master"
gem "globalize", github: "globalize/globalize"
gem "activemodel-serializers-xml"
gem "devise-i18n"
gem "i18n_generators", "~> 2.1", ">= 2.1.1"
gem "i18n-tasks", "~> 0.9.6"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

gem "bootstrap-generators", "~> 3.3.4"
gem "select2-rails"
gem "bootstrap-switch-rails"

gem "cocoon"
gem "deep_cloneable", "~> 2.2.2"
gem "devise"
gem "cancancan", "~> 1.10"

group :development, :test do
  gem "pry-byebug"
end

group :development do
  gem "rubocop", require: false
  gem "rails-erd"
  gem "rack-livereload"
  gem "guard-livereload", "~> 2.5", require: false
  gem "foreman"
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
