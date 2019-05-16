class AddCommentTable < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title, null: false, limit: 50, default: ""
      t.text :comment, null: false
      t.references :commentable, null: false, polymorphic: true
      t.timestamps
    end
  end
end
