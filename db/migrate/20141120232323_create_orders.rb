class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :photo_id
      t.string :balanced_href

      t.timestamps
    end
  end
end
