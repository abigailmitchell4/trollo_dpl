class BoardsController < ApplicationController
  before_action :set_board, only: [:list, :edit, :update, :destroy]

  def index
    #SELECT all records for current User
    @boards = Board.all_boards(current_user.id)
  end

  def list
  end

  def new
    @board = current_user.boards.new
  end 

  def create
    # INSERT one record
    Board.create_board(board_params, current_user.id)
    redirect_to boards_path
  end

  def edit
  end

  def update
    Board.update_board(@board.id, board_params)
    redirect_to boards_path
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private
    def set_board
      #SELECT single record
      @board = Board.single_board(current_user.id, params[:id])
    end

    def board_params
      params.require(:board).permit(:board_name)
    end
end