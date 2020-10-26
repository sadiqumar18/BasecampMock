class AttachmentsController < ApplicationController
  include SessionHelper
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = current_user.attachments
  end

  def attachment
    @attachments = current_user.attachments.where(project_id: params[:id])
    render action: "index"
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = current_user.attachments.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to get_attachments_path(id: @attachment.project_id), notice: "Attachment was successfully created." }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { redirect_to new_attachment_path(project_id: @attachment.project_id), notice: @attachment.errors }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: "Attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to get_attachments_path(id: @attachment.project_id), notice: "Attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attachment_params
    params.require(:attachment).permit(:project_id, :file_name, :file)
  end
end
