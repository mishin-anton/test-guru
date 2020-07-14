class ChangeRuleToRuleId < ActiveRecord::Migration[6.0]
  def change
    rename_column :bages, :rule, :rule_id
  end
end
