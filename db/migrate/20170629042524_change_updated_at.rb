class ChangeUpdatedAt < ActiveRecord::Migration[5.1]
  def change

      def up
      change_table :orders do |t|
        t.change :updated_at,  null: true

      end
    end

    def down
      change_table :orders do |t|
        t.change :updated_at,  null: false

      end
    end


  end
end
