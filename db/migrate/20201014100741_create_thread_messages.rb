class CreateThreadMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :thread_messages do |t|
      t.text :message
      t.string :author
      t.references :thread_message, null: true, foreign_key:true

      t.timestamps
    end
  end
end
