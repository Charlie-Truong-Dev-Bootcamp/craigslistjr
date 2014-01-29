class CreateTables < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

     create_table :posts do |t|
       t.string :title
       t.string :description
       t.integer :category_id
       t.belongs_to :category
       t.string :email
       t.string :status
       t.decimal :price
       t.integer :key
       t.timestamps
    end

     add_index :posts, :category_id

  end
end
