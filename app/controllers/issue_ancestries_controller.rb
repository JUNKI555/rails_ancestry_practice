class IssueAncestriesController < ApplicationController
  before_action :set_issue_ancestry, only: %i[ show edit update destroy ]

  # GET /issue_ancestries or /issue_ancestries.json
  def index
    @issue_ancestries = IssueAncestry.all
  end

  # GET /issue_ancestries/1 or /issue_ancestries/1.json
  def show
  end

  # GET /issue_ancestries/new
  def new
    @issue_ancestry = IssueAncestry.new
  end

  # GET /issue_ancestries/1/edit
  def edit
  end

  # POST /issue_ancestries or /issue_ancestries.json
  def create
    @issue_ancestry = IssueAncestry.new(issue_ancestry_params)

    respond_to do |format|
      if @issue_ancestry.save
        format.html { redirect_to issue_ancestry_url(@issue_ancestry), notice: "Issue ancestry was successfully created." }
        format.json { render :show, status: :created, location: @issue_ancestry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue_ancestry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_ancestries/1 or /issue_ancestries/1.json
  def update
    respond_to do |format|
      if @issue_ancestry.update(issue_ancestry_params)
        format.html { redirect_to issue_ancestry_url(@issue_ancestry), notice: "Issue ancestry was successfully updated." }
        format.json { render :show, status: :ok, location: @issue_ancestry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue_ancestry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_ancestries/1 or /issue_ancestries/1.json
  def destroy
    @issue_ancestry.destroy

    respond_to do |format|
      format.html { redirect_to issue_ancestries_url, notice: "Issue ancestry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_ancestry
      @issue_ancestry = IssueAncestry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_ancestry_params
      params.require(:issue_ancestry).permit(:epic_ancestry_id, :issue_name, :description)
    end
end
