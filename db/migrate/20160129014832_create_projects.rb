class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
    add_index :projects, :project_id
  end
end
