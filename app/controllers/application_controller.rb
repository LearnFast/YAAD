class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
end

# This is to disable JazzHands from changing your console.
# unless you call "rails jhc"
if ARGV[0] == 'jhc' || ARGV[0] == 'jazzhands_console'
  ARGV[0] = "console"
else
  ENV['DISABLE_PRY_RAILS'] = 'true'
end
