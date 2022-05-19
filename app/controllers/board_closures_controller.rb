class BoardClosuresController < ApplicationController
  before_action :set_board_closure, only: %i[ show edit update destroy ]

  # GET /board_closures or /board_closures.json
  def index
    @board_closures = BoardClosure.all
  end

  # GET /board_closures/1 or /board_closures/1.json
  def show
  end

  # GET /board_closures/new
  def new
    @board_closure = BoardClosure.new
  end

  # GET /board_closures/1/edit
  def edit
  end

  # POST /board_closures or /board_closures.json
  def create
    @board_closure = BoardClosure.new(board_closure_params)

    respond_to do |format|
      if @board_closure.save
        format.html { redirect_to board_closure_url(@board_closure), notice: "Board closure was successfully created." }
        format.json { render :show, status: :created, location: @board_closure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_closures/1 or /board_closures/1.json
  def update
    respond_to do |format|
      if @board_closure.update(board_closure_params)
        format.html { redirect_to board_closure_url(@board_closure), notice: "Board closure was successfully updated." }
        format.json { render :show, status: :ok, location: @board_closure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_closures/1 or /board_closures/1.json
  def destroy
    @board_closure.destroy

    respond_to do |format|
      format.html { redirect_to board_closures_url, notice: "Board closure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_closure
      @board_closure = BoardClosure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_closure_params
      params.require(:board_closure).permit(:board_name)
    end
end
