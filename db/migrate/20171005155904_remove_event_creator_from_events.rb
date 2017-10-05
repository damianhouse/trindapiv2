class RemoveEventCreatorFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :event_creator, :integer
  end
end
