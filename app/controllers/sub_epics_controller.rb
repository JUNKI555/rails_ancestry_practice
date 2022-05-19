class SubEpicsController < ApplicationController
  before_action :set_sub_epic, only: %i[ show edit update destroy ]

  # GET /sub_epics or /sub_epics.json
  def index
    @sub_epics = SubEpic.all
  end

  # GET /sub_epics/1 or /sub_epics/1.json
  def show
  end

  # GET /sub_epics/new
  def new
    @sub_epic = SubEpic.new
  end

  # GET /sub_epics/1/edit
  def edit
  end

  # POST /sub_epics or /sub_epics.json
  def create
    @sub_epic = SubEpic.new(sub_epic_params)

    respond_to do |format|
      if @sub_epic.save
        format.html { redirect_to sub_epic_url(@sub_epic), notice: "Sub epic was successfully created." }
        format.json { render :show, status: :created, location: @sub_epic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_epic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_epics/1 or /sub_epics/1.json
  def update
    respond_to do |format|
      if @sub_epic.update(sub_epic_params)
        format.html { redirect_to sub_epic_url(@sub_epic), notice: "Sub epic was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_epic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_epic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_epics/1 or /sub_epics/1.json
  def destroy
    @sub_epic.destroy

    respond_to do |format|
      format.html { redirect_to sub_epics_url, notice: "Sub epic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_epic
      @sub_epic = SubEpic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_epic_params
      params.require(:sub_epic).permit(:sub_board_id, :epic_name, :cost)
    end
end
