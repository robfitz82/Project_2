class CreateCategoryPhotos < ActiveRecord::Migration
  def change
    create_table :category_photos do |t|
    	t.references :category
    	t.references :photo
      t.timestamps
    end
  end
end
