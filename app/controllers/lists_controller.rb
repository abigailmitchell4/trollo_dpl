class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    # @lists = @board.lists
    @lists = List.all_lists(current_user.id)
  end

  def show
  
  end

  def new
    @list = @board.lists.new
  end

  def edit
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to board_lists_path 
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to board_list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)
  end


  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:list_name, :list_priority)
    end
end
