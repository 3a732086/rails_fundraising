class CreateProjectSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :project_supports do |t|

      t.timestamps
    end
  end
end
