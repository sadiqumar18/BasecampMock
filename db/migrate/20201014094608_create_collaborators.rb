class CreateCollaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborators do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
