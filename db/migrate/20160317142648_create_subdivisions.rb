class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.string :code
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
