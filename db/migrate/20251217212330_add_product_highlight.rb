class AddProductHighlight < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :highlight, :boolean, default: false, null: false, after: :price
    add_column :categories, :status, :boolean, default: true, null: false, after: :name
    
    create_table :product_categories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
    
  end
end
