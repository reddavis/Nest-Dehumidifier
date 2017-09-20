# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks


task :collect_reading => :environment do
  nest = NestThermostat::Nest.new(email: ENV['NEST_EMAIL'], password: ENV['NEST_PASSWORD'], temperature_scale: :celsius)
  temperature = nest.current_temp
  humidity = nest.humidity
  
  ForecastIO.configure do |configuration|
    configuration.api_key = ENV['FORECAST_IO']
  end
  
  forecast = ForecastIO.forecast(ENV['LATITUDE'].to_f, ENV['LONGITUDE'].to_f, time: Time.now.to_i, params: {units: 'uk2'})
  outside_temperature = forecast.currently.temperature
  outside_humidity = forecast.currently.humidity * 100.0
  
  Reading.create(:temperature => temperature, :outside_temperature => outside_temperature, :humidity => humidity, :outside_humidity => outside_humidity)
  
  ## Update dehumidifer
  last_dehumidifier_change = DehumidifierState.last
  
  if humidity > ENV['HUMIDITY_THRESHOLD'].to_i
    # Turn on dehumidifier
    if last_dehumidifier_change.nil? || !last_dehumidifier_change.on
      HTTParty.post(ENV['IFTTT_TURN_ON'])
      
      DehumidifierState.create(:on => true)
    end
  else
    if last_dehumidifier_change.nil? || last_dehumidifier_change.on
      # Turn off dehumidifier
      HTTParty.post(ENV['IFTTT_TURN_OFF'])
      
      DehumidifierState.create(:on => false)
    end
  end
end


task :purge_database => :environment do
  Reading.delete_all
  DehumidifierState.delete_all
end
