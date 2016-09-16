class GraphController < ApplicationController
  def index
    @readings = Reading.order('created_at DESC').limit(144).all.to_a
    
    all_temp_values = @readings.map {|x| [x.temperature, x.outside_temperature] }.flatten
    @max_temp_value = all_temp_values.max
    @min_temp_value = all_temp_values.min
    
    all_humidity_values = @readings.map {|x| [x.humidity, x.outside_humidity] }.flatten
    @max_humidity_value = all_humidity_values.max
    @min_humidity_value = all_humidity_values.min
    
    @last_reading = @readings.first
    @dehumidifier_state = DehumidifierState.last
  end
end
