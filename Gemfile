source 'http://rubygems.org'

gem 'rake'

group :test, :integration do
  gem 'berkshelf', '~> 3.2'
end

group :test do
  gem 'chefspec', '~> 4.1'
  gem 'foodcritic', '~> 4.0.0'
end

group :integration do
  gem 'test-kitchen', '~> 1.2.1'
  gem 'kitchen-vagrant', '~> 0.15'
  gem 'kitchen-openstack', '~> 1.7'
end

group :development do
  gem 'rubocop', '~> 0.28'
  gem 'guard', '~> 2.10'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end
