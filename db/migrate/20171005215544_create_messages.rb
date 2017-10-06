class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.string :body
      t.integer :author_id
      t.boolean :viewed

      t.timestamps
    end
    add_index :messages, :conversation_id
    add_index :messages, :author_id
  end
end
