class Poststype < ActiveRecord::Migration[5.0]
  def change
      rename_column(:posts,:type, :p_type)
  end
end
