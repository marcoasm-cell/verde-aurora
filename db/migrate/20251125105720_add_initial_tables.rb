class AddInitialTables < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.string  :phone
      t.string  :mobile_phone
      t.datetime  :birthdate
      t.text    :address
      t.boolean :status
      t.boolean :admin

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false
    end

    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.integer :views_count, null: false, default: 0
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end

    create_table :colors do |t|
      t.string :name, null: false
      t.string :code, null: false
    end

    create_table :fragances do |t|
      t.string :name, null: false
      t.string :code, null: false
    end

    create_table :contacts do |t|
      t.string :email, null: false
      t.string :phone
      t.string :name
      t.text :message
      t.references :product, null: true, foreign_key: true
      t.references :color, null: true, foreign_key: true
      t.timestamps
    end

    create_table :orders do |t|
      t.boolean :status
      t.string :client_name
      t.string :client_email
      t.string :client_phone
      t.string :client_address

      t.decimal :price, precision: 10, scale: 2
      t.decimal :ports, precision: 10, scale: 2
      t.timestamps
    end

    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :color, null: true, foreign_key: true
      t.references :fragance, null: true, foreign_key: true
      t.integer :quantity, null: false, default: 1
      
      t.timestamps
    end
  end
end
