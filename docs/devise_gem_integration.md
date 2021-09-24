Note: this documents only for New User table integration

request: Follow this documentation
  https://github.com/heartcombo/devise

Add in Gemfile
  gem 'devise'

run
  bundle install

run
  rails generate devise:install

Add in config/environments/development.rb (in the middle)
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

Add in app/views/layouts/application.html.erb in <body> section, (this is temporary code, we need to fix it)
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
    <% if current_user.present? %>
      <div>
        <h2><%= link_to("Logout", destroy_user_session_path, :method => :delete) %></h2>
      </div>
    <% end %>

run (you can change the User with any other Model name)
  rails generate devise User

run
  rails db:migrate

add in app/controllers/application_controller.rb
  before_action :authenticate_user!

