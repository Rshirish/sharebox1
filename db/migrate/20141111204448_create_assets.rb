class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :project_id
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
    
  end
end
