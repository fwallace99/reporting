class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    def up
    change_table :orders do |t|
      t.change :scheduled_at,  null: true
      t.change :processed_at,  null: true
    end
  end

  def down
    change_table :orders do |t|
      t.change :scheduled_at,  null: true
      t.change :processed_at,  null: true
    end
  end
  
  end
end
