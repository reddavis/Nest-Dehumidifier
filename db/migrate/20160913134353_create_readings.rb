class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.float :temperature, :default => 0.0
      t.float :outside_temperature, :default => 0.0
      t.float :humidity, :default => 0.0
      t.timestamps
    end
  end
end
