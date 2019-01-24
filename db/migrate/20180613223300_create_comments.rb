class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :body

      t.timestamps
    end
    
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
