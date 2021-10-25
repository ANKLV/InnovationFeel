# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :admins, index: true
      t.string :title

      t.timestamps
    end
  end
end
