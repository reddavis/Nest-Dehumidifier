class AddOutsideHumidity < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :outside_humidity, :float, :default => 0.0
  end
end
