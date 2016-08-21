class ChangepassedFieldForcomments < ActiveRecord::Migration[5.0]
  def change
    change_column(:comments,:passed, :integer, default: "0")
  end
end
