source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'devise'
gem 'activeadmin'
gem 'activeadmin_quill_editor'   #for quill -editor
gem 'sassc'                      
gem "paperclip"                 #for image
gem "paperclip-ffmpeg"          #for video
gem 'paperclip-av-transcoder'   #for video uploading
gem "rails_admin_import"        #for csv import
gem "mail_form"                 #for smtp mail

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "sprockets-rails"
  gem 'sass-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #gem "letter_opener"        # for mail preview
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
