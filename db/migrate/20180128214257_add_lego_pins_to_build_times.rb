class AddLegoPinsToBuildTimes < ActiveRecord::Migration[5.1]
  def change
    add_reference :build_times, :legopins, foreign_key: true
  end
end
