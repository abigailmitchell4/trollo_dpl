class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy

  def self.all_boards(user_id)
    #ADD SQL
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b
      WHERE b.user_id = #{user_id}"
    )
  end

  def self.single_board(user_id, board_id)
    Board.find_by_sql(["
      SELECT * 
      FROM boards AS b
      WHERE b.id = ? AND b.user_id = ?
    ", board_id, user_id]).first
  end

  def self.create_board(p, id)
    Board.find_by_sql(["
      INSERT INTO boards (board_name, user_id, created_at, updated_at)
      VALUES (:board_name, :user_id, :created_at, :updated_at);
    ", {
      board_name: p[:board_name],
      user_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end
  
  def self.update_board(id, p)
    Board.find_by_sql(["
      UPDATE boards AS b
      SET board_name = ?, updated_at = ?
      WHERE b.id = ?
    ;", p[:board_name], DateTime.now, id])
  end

end
