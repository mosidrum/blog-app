# frozen_string_literal: true

class AddConfirmationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmation_token, :string
  end
end
