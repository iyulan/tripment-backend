# frozen_string_literal: true

class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table(:procedures) do |t|
      t.string(:name, null: false)
      t.text(:description)

      t.timestamps
    end
  end
end
