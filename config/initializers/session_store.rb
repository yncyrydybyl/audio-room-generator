# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_audio-room-generator_session',
  :secret      => '1f84ac438a536e9bd4be86f59af8d0a90023bcbe8b0067da2afb0914c0e89baee2fc27e386762462ed021f60696cafc9e75e92c0b38990793039761dc76115c1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
