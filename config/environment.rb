# Load the Rails application.
require_relative 'application'

app_environment_variables = File.join(Rails.root, 'config', 'nest_ifttt_config.rb')
load(app_environment_variables) if File.exists?(app_environment_variables)

# Initialize the Rails application.
Rails.application.initialize!