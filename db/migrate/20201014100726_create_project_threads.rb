class CreateProjectThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :project_threads do |t|
      t.string :thread_title
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
