class ChangeDancingStylesToArrayInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :dancing_styles, :string, array: true, default: [], using: "(string_to_array(dancing_styles, ','))"
  end
end
