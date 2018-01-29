class AddUserIdToBuildTimes < ActiveRecord::Migration[5.1]
  def change
    add_reference :build_times, :user, foreign_key: true
  end
end
