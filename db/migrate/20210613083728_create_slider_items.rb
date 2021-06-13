class CreateSliderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :slider_items do |t|

      t.timestamps
    end
  end
end
