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


generatting devise MVC
  add in config/initializers/devise.rb (we are doing this bcs want to show all devise view in users directory not devise)
    config.scoped_views = true

  run (to generate devise view in users scope)
    rails generate devise:views users

  run (to generate devise controllers in users scope)
    rails generate devise:controllers users

  add in config/routes.rb
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
    }

    and remove exisitng devise_for :users
