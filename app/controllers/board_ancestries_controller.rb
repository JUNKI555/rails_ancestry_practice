class BoardAncestriesController < ApplicationController
  before_action :set_board_ancestry, only: %i[ show edit update destroy ]

  # GET /board_ancestries or /board_ancestries.json
  def index
    @board_ancestries = BoardAncestry.all
  end

  # GET /board_ancestries/1 or /board_ancestries/1.json
  def show
  end

  # GET /board_ancestries/new
  def new
    @board_ancestry = BoardAncestry.new
  end

  # GET /board_ancestries/1/edit
  def edit
  end

  # POST /board_ancestries or /board_ancestries.json
  def create
    @board_ancestry = BoardAncestry.new(board_ancestry_params)

    respond_to do |format|
      if @board_ancestry.save
        format.html { redirect_to board_ancestry_url(@board_ancestry), notice: "Board ancestry was successfully created." }
        format.json { render :show, status: :created, location: @board_ancestry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_ancestry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_ancestries/1 or /board_ancestries/1.json
  def update
    respond_to do |format|
      if @board_ancestry.update(board_ancestry_params)
        format.html { redirect_to board_ancestry_url(@board_ancestry), notice: "Board ancestry was successfully updated." }
        format.json { render :show, status: :ok, location: @board_ancestry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_ancestry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_ancestries/1 or /board_ancestries/1.json
  def destroy
    @board_ancestry.destroy

    respond_to do |format|
      format.html { redirect_to board_ancestries_url, notice: "Board ancestry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_ancestry
      @board_ancestry = BoardAncestry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_ancestry_params
      params.require(:board_ancestry).permit(:board_name)
    end
end
