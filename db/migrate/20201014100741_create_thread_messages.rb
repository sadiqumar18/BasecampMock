class CreateThreadMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :thread_messages do |t|
      t.string :thread_id
      t.text :message

      t.timestamps
    end
  end
end
