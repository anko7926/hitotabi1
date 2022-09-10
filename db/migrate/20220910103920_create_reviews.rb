class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

       ## ジャンルIDを保存するカラム
      t.integer :genre_id, null: false

      ## タグIDを保存するカラム
      t.integer :tag_id, null: false

      ## タイトルを保存するカラム
      t.string :title, null: false

      ## コメントを保存するカラム
      t.text :travel_comment, null: false

      ## レビュー評価を保存するカラム
      t.float :evaluation, null: false

      t.timestamps
    end
  end
end
