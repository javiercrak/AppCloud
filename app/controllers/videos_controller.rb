class VideosController < ApplicationController
  #before_action :set_video, only: [:show, :edit, :update, :destroy]
  require 'streamio-ffmpeg'
  before_filter :load_parent

  # GET /videos
  # GET /videos.json
  def index
    @videos = @contest.videos.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = @contest.videos.find(params[:id])
  end

  # GET /videos/new
  def new
    @video = @contest.videos.new
  end

  # GET /videos/1/edit
  def edit
    @video = @contest.videos.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create

    #@contest = Contest.find(params[:parent_id])

    @video =  @contest.videos.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to [@contest,@video] , notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @contest.videos.update(video_params)
        format.html { redirect_to [@contest,@video], notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = @contest.videos.find(params[:id])
    @video.destroy
    respond_to do |format|
      format.html { redirect_to [@contest,@video], notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def convert

    movie = FFMPEG::Movie.new( "public/system/videos/9/youtube.com.Muy_Buenas_Noches__Muy_Buenas_noches__Hasta_Mañana_-_YouTube.m4v")
    options = "-threads 2 -s 320x240 -r 30.00 -threads 1 -pix_fmt yuv420p -g 300 -qmin 3 -b 512k -async 50 -acodec libmp3lame -ar 11025 -ac 1 -ab 16k"
    movie.transcode("public/system/videos/9/output.flv", options)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :lastname, :email, :message, :converted, :contest_id, :video)
    end
  def load_parent
    unless params[:contest_id]==nil
       @contest = Contest.find(params[:contest_id])
      end
  end
end
