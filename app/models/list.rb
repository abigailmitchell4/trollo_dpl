class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  # def self.all_lists(board_id)
  #   List.find_by_sql(
  #     "SELECT *
  #     FROM lists AS l
  #     WHERE l.board_id = #{board_id}"
  #   )
  # end
end
