class CreateDehudifierStates < ActiveRecord::Migration[5.0]
  def change
    create_table :dehumidifier_states do |t|
      t.boolean :on, :default => false
      t.timestamps
    end
  end
end
