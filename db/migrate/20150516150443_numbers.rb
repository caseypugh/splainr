class Numbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string     :phone_number
      t.text       :message
      t.timestamps
    end

    add_index :numbers, :phone_number
  end
end
