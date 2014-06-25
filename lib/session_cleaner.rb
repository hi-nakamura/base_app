class SessionCleaner
  def self.remove_stale_sessions
    ActiveRecord::SessionStore::Session.delete_all
  end
end
