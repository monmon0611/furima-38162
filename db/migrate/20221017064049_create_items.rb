class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,               nill: false
      t.text :explanation,           nill: false
      t.integer :category_id,        nill: false
      t.integer :situation_id,       nill: false
      t.integer :load_id,            nill: false
      t.integer :shipping_origin_id, nill: false
      t.integer ,   nill: false
      t.integer :price,              nill: false
      t.references :user,            nill: false, foreign_key: true
      t.timestamps
    end
  end
end
