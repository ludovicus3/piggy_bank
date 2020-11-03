class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    if on_postgresql?
      create_table :budgets, id: :uuid do |t|
        t.string  :name, null: false

        t.timestamps
      end
    else
      create_table :budgets, id: :string do |t|
        t.string  :name, null: false

        t.timestamps
      end
    end

    add_index :budgets, :name
  end

  def on_postgresql?
    ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
  end
end
