class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :project_id
      t.string :uploaded_by
      t.text :file_name

      t.timestamps
    end
  end
end
