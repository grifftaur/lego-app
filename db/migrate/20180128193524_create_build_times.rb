class CreateBuildTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :build_times do |t|
      t.integer :completetime
      t.timestamps
    end
  end
end
