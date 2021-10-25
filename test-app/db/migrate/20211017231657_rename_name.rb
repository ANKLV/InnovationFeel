# frozen_string_literal: true

class RenameName < ActiveRecord::Migration[6.1]
  def change
    rename_column :admins, :name, :username
  end
end
