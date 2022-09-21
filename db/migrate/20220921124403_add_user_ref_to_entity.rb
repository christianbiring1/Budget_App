class AddUserRefToEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :user, null: false, foreign_key: :true, on_delete: :cascade
    add_reference :groups, :user, null: false, foreign_key: :true, on_delete: :cascade
    add_reference :groups, :entity, null: false, foreign_key: :true
    add_reference :entities, :group, null: false, foreign_key: :true
  end
end
