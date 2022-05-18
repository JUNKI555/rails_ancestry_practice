class SubBoardsController < ApplicationController
  before_action :set_sub_board, only: %i[ show edit update destroy ]

  # GET /sub_boards or /sub_boards.json
  def index
    @sub_boards = SubBoard.all
  end

  # GET /sub_boards/1 or /sub_boards/1.json
  def show
  end

  # GET /sub_boards/new
  def new
    @sub_board = SubBoard.new
  end

  # GET /sub_boards/1/edit
  def edit
  end

  # POST /sub_boards or /sub_boards.json
  def create
    @sub_board = SubBoard.new(sub_board_params)

    respond_to do |format|
      if @sub_board.save
        format.html { redirect_to sub_board_url(@sub_board), notice: "Sub board was successfully created." }
        format.json { render :show, status: :created, location: @sub_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_boards/1 or /sub_boards/1.json
  def update
    respond_to do |format|
      if @sub_board.update(sub_board_params)
        format.html { redirect_to sub_board_url(@sub_board), notice: "Sub board was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_boards/1 or /sub_boards/1.json
  def destroy
    @sub_board.destroy

    respond_to do |format|
      format.html { redirect_to sub_boards_url, notice: "Sub board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_board
      @sub_board = SubBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_board_params
      params.require(:sub_board).permit(:board_name)
    end
end
