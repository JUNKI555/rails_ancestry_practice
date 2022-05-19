class IssueClosuresController < ApplicationController
  before_action :set_issue_closure, only: %i[ show edit update destroy ]

  # GET /issue_closures or /issue_closures.json
  def index
    @issue_closures = IssueClosure.all
  end

  # GET /issue_closures/1 or /issue_closures/1.json
  def show
  end

  # GET /issue_closures/new
  def new
    @issue_closure = IssueClosure.new
  end

  # GET /issue_closures/1/edit
  def edit
  end

  # POST /issue_closures or /issue_closures.json
  def create
    @issue_closure = IssueClosure.new(issue_closure_params)

    respond_to do |format|
      if @issue_closure.save
        format.html { redirect_to issue_closure_url(@issue_closure), notice: "Issue closure was successfully created." }
        format.json { render :show, status: :created, location: @issue_closure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_closures/1 or /issue_closures/1.json
  def update
    respond_to do |format|
      if @issue_closure.update(issue_closure_params)
        format.html { redirect_to issue_closure_url(@issue_closure), notice: "Issue closure was successfully updated." }
        format.json { render :show, status: :ok, location: @issue_closure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_closures/1 or /issue_closures/1.json
  def destroy
    @issue_closure.destroy

    respond_to do |format|
      format.html { redirect_to issue_closures_url, notice: "Issue closure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_closure
      @issue_closure = IssueClosure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_closure_params
      params.require(:issue_closure).permit(:epic_closure_id, :issue_name, :description)
    end
end
