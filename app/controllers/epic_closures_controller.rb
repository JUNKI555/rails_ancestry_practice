class EpicClosuresController < ApplicationController
  before_action :set_epic_closure, only: %i[ show edit update destroy ]

  # GET /epic_closures or /epic_closures.json
  def index
    @epic_closures = EpicClosure.all
  end

  # GET /epic_closures/1 or /epic_closures/1.json
  def show
  end

  # GET /epic_closures/new
  def new
    @epic_closure = EpicClosure.new
  end

  # GET /epic_closures/1/edit
  def edit
  end

  # POST /epic_closures or /epic_closures.json
  def create
    @epic_closure = EpicClosure.new(epic_closure_params)

    respond_to do |format|
      if @epic_closure.save
        format.html { redirect_to epic_closure_url(@epic_closure), notice: "Epic closure was successfully created." }
        format.json { render :show, status: :created, location: @epic_closure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @epic_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epic_closures/1 or /epic_closures/1.json
  def update
    respond_to do |format|
      if @epic_closure.update(epic_closure_params)
        format.html { redirect_to epic_closure_url(@epic_closure), notice: "Epic closure was successfully updated." }
        format.json { render :show, status: :ok, location: @epic_closure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @epic_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epic_closures/1 or /epic_closures/1.json
  def destroy
    @epic_closure.destroy

    respond_to do |format|
      format.html { redirect_to epic_closures_url, notice: "Epic closure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epic_closure
      @epic_closure = EpicClosure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def epic_closure_params
      params.require(:epic_closure).permit(:board_closure_id, :epic_name, :cost)
    end
end
