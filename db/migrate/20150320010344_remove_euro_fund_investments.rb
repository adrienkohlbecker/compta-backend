# frozen_string_literal: true
class RemoveEuroFundInvestments < ActiveRecord::Migration
  def change
    drop_table :euro_fund_investments
  end
end
