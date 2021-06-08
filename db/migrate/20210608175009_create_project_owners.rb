class CreateProjectOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :project_owners do |t|

      t.timestamps
    end
  end
end
