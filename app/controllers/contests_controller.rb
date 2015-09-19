class ContestsController < ApplicationController
  load_and_authorize_resource
  #load_and_authorize_resource :through => :contest
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  # GET /contests
  # GET /contests.json
  def index

      @contests = Contest.all

  end

  # GET /contests/1
  # GET /contests/1.json
  def show
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # GET /contests/1/edit
  def edit
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = current_user.contests.new(contest_params) do |t|
    #@contest.user = current_user
      if contest_params[:data]
        contest_params[:data].rewind
        t.binary_data = contest_params[:data].read
        t.filename = contest_params[:data].original_filename
        t.content_type = contest_params[:data].content_type
      end
    end

    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest was successfully created.' }
        format.json { render :show, status: :created, location: @contest }
      else
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview
    @contest = Contest.find(params[:id])
    send_data(@contest.binary_data, :type => @contest.content_type, :filename => @contest.filename, :disposition => "inline")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contest
    @contest = Contest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contest_params
    params.require(:contest).permit(:name, :url, :startdate, :enddate, :binary_data, :content_type, :description, :user_id, :data)
  end
end
