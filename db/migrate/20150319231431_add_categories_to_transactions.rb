# frozen_string_literal: true
class AddCategoriesToTransactions < ActiveRecord::Migration
  def change
    add_column :portfolio_transactions, :category, :string
  end
end
