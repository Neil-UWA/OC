class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
