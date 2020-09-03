# frozen_string_literal: true

class MakeArticleActiveByDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :active, :boolean, default: true
  end
end
