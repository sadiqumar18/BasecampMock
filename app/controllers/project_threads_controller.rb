class ProjectThreadsController < ApplicationController
  include SessionHelper
  before_action :set_project_thread, only: [:show, :edit, :update, :destroy]

  # GET /project_threads
  # GET /project_threads.json
  def index
    @project_threads
  end

  # GET /project_threads/1
  # GET /project_threads/1.json
  def show
    @thread_messages = ThreadMessage.where(project_thread_id: params[:id])
  end

  def threads
    @project_threads = current_user.project_threads.where(project_id: params[:id])
    render action: "index"
  end

  # GET /project_threads/new
  def new
    @project_thread = ProjectThread.new
  end

  # GET /project_threads/1/edit
  def edit
  end

  # POST /project_threads
  # POST /project_threads.json
  def create
    @project_thread = current_user.project_threads.new(project_thread_params)

    respond_to do |format|
      if @project_thread.save
        format.html { redirect_to @project_thread, notice: "Project thread was successfully created." }
        format.json { render :show, status: :created, location: @project_thread }
      else
        format.html { render :new }
        format.json { render json: @project_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_threads/1
  # PATCH/PUT /project_threads/1.json
  def update
    respond_to do |format|
      if @project_thread.update(project_thread_params)
        format.html { redirect_to @project_thread, notice: "Project thread was successfully updated." }
        format.json { render :show, status: :ok, location: @project_thread }
      else
        format.html { render :edit }
        format.json { render json: @project_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_threads/1
  # DELETE /project_threads/1.json
  def destroy
    @project_thread = ProjectThread.find(params[:id])
    @project_thread.destroy()
    respond_to do |format|
      format.html { redirect_to get_project_thread_url(@project_thread.project.id), notice: "Project thread was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_thread
    @project_thread = ProjectThread.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_thread_params
    params.require(:project_thread).permit(:project_id, :thread_title)
  end
end
