class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

       ## レビューIDを保存するカラム
      t.integer :review_id, null: false

      ## ユーザーIDを保存するカラム
      t.integer :user_id, null: false

      ## コメントを保存するカラム
      t.text :impression_comment, null: false

      t.timestamps
    end
  end
end
