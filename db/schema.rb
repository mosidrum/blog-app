# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error-prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_920_135_845) do
  enable_extension 'plpgsql'

  # Define 'comments' table
  create_table 'comments', force: :cascade do |t|
    t.string 'text'
    t.bigint 'userId_id'
    t.bigint 'postId_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['postId_id'], name: 'index_comments_on_postId_id'
    t.index ['userId_id'], name: 'index_comments_on_userId_id'
  end

  # Define 'likes' table
  create_table 'likes', force: :cascade do |t|
    t.bigint 'userId_id'
    t.bigint 'postId_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['postId_id'], name: 'index_likes_on_postId_id'
    t.index ['userId_id'], name: 'index_likes_on_userId_id'
  end

  # Define 'posts' table
  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.string 'text'
    t.integer 'commentsCounter'
    t.integer 'likesCounter'
    t.bigint 'authorId_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['authorId_id'], name: 'index_posts_on_authorId_id'
  end

  # Define 'users' table
  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.string 'bio'
    t.integer 'postCounter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  # Add foreign keys
  add_foreign_key 'comments', 'posts', column: 'postId_id'
  add_foreign_key 'comments', 'users', column: 'userId_id'
  add_foreign_key 'likes', 'posts', column: 'postId_id'
  add_foreign_key 'likes', 'users', column: 'userId_id'
  add_foreign_key 'posts', 'users', column: 'authorId_id'
end
