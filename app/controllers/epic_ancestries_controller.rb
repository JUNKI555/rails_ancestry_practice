class EpicAncestriesController < ApplicationController
  before_action :set_epic_ancestry, only: %i[ show edit update destroy ]

  # GET /epic_ancestries or /epic_ancestries.json
  def index
    @epic_ancestries = EpicAncestry.all
  end

  # GET /epic_ancestries/1 or /epic_ancestries/1.json
  def show
  end

  # GET /epic_ancestries/new
  def new
    @epic_ancestry = EpicAncestry.new
  end

  # GET /epic_ancestries/1/edit
  def edit
  end

  # POST /epic_ancestries or /epic_ancestries.json
  def create
    @epic_ancestry = EpicAncestry.new(epic_ancestry_params)

    respond_to do |format|
      if @epic_ancestry.save
        format.html { redirect_to epic_ancestry_url(@epic_ancestry), notice: "Epic ancestry was successfully created." }
        format.json { render :show, status: :created, location: @epic_ancestry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @epic_ancestry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epic_ancestries/1 or /epic_ancestries/1.json
  def update
    respond_to do |format|
      if @epic_ancestry.update(epic_ancestry_params)
        format.html { redirect_to epic_ancestry_url(@epic_ancestry), notice: "Epic ancestry was successfully updated." }
        format.json { render :show, status: :ok, location: @epic_ancestry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @epic_ancestry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epic_ancestries/1 or /epic_ancestries/1.json
  def destroy
    @epic_ancestry.destroy

    respond_to do |format|
      format.html { redirect_to epic_ancestries_url, notice: "Epic ancestry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epic_ancestry
      @epic_ancestry = EpicAncestry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def epic_ancestry_params
      params.require(:epic_ancestry).permit(:board_ancestry_id, :epic_name, :cost)
    end
end
