source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'jquery-rails'
gem 'haml-rails'

gem 'activeadmin', :git => 'git://github.com/gregbell/active_admin.git'
gem 'meta_search',  '>= 1.1.0.pre'

# Add these for some marketing screens I am doing - LB
gem 'less-rails-bootstrap'
gem 'formtastic'
gem 'formtastic-bootstrap'
gem 'bootstrap-kaminari-views'

gem 'faker'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'execjs'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'thin'
	gem 'pg'
end

group :development, :test do
	gem 'sqlite3'
  gem 'debugger'
  gem 'heroku'
  gem 'heroku_plus'
  gem 'taps'
  gem 'foreman'
  gem 'ruby_parser'
end

group :test do
  
end