###  Note: this documents only for New User Model integration

**Request:** Follow [Devise Gem](https://github.com/heartcombo/devise) documentation.

### Steps
* Add in Gemfile

```bash
gem 'devise'
```

* run

```bash
$ bundle install
```

* to install devise, it will create config/initializers/devise.rb


```bash
$ rails generate devise:install
```

* Add in config/environments/development.rb (in the middle)

```bash
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

* Add in app/views/layouts/application.html.erb in <body> section, (this is temporary code)

```html
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
<% if current_user.present? %>
  <div>
    <h2><%= link_to("Logout", destroy_user_session_path, method: :delete) %></h2>
  </div>
<% end %>
```

* To create Models and related migration, run (you can change the User with any other Model name)

```bash
$ rails generate devise User
```

* To migrate

```bash
$ rails db:migrate
```

* Add in app/controllers/application_controller.rb

```bash
before_action :authenticate_user!
```

* To generatting devise MVC
  add in config/initializers/devise.rb (Doing this because we want to show all devise view in users directory not devise)

 ```bash
config.scoped_views = true
```

* Run (to generate devise view in users scope)

```bash
$ rails generate devise:views users
```

* Run (to generate devise controllers in users scope)

```bash
$ rails generate devise:controllers users
```

* add in config/routes.rb

```bash
devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
  passwords: 'users/passwords',
}
```

* And remove exisitng
```bash
devise_for :users
```
