class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :event_creator
      t.string :title
      t.string :description
      t.string :interests
      t.string :location
      t.string :lat
      t.string :long

      t.timestamps
    end
    add_index :events, :event_creator
  end
end
