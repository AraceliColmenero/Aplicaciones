class CreateAutos < ActiveRecord::Migration[5.0]
  def change
    create_table :autos do |t|
      t.string :marca
      t.string :modelo
      t.date :anio

      t.timestamps
    end
  end
end
