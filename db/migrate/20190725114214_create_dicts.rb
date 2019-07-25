class CreateDicts < ActiveRecord::Migration[5.2]
  def change
    create_table :dicts do |t|
      t.string :eword
      t.string :jword
      t.string :jkana

      t.timestamps
    end
  end
end
