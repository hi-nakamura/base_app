class CustomDevise::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
    ActiveRecord::SessionStore::Session.delete_all session_id: request.session_options[:id]
  end
end
