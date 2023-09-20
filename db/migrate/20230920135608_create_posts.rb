# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.integer :likesCounter
      t.references :authorId, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
