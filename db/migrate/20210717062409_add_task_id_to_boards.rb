class AddTaskIdToBoards < ActiveRecord::Migration[6.1]
  def change
    add_reference :boards, :task
  end
end
