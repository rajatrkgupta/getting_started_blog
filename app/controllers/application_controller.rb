class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
end
