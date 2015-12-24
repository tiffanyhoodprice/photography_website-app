class CreateCategorizedPhotos < ActiveRecord::Migration
  def change
    create_table :categorized_photos do |t|

      t.timestamps null: false
    end
  end
end
