class ThreadMessagesController < ApplicationController
  before_action :set_thread_message, only: [:show, :edit, :update, :destroy]

  # GET /thread_messages
  # GET /thread_messages.json
  def index
    @thread_messages = ThreadMessage.all
  end

  # GET /thread_messages/1
  # GET /thread_messages/1.json
  def show
    # @messages = ThreadMessage.where(project_id: params[:project_id] )
  end

  # GET /thread_messages/new
  def new
    @thread_message = ThreadMessage.new
    @thread_id=params[:project_thread_id]
  end

  # GET /thread_messages/1/edit
  def edit
    @thread_message = ThreadMessage.find_by(id: params[:id])
  end

  # POST /thread_messages
  # POST /thread_messages.json
  def create
    @thread_message = ThreadMessage.new(thread_message_params)

    respond_to do |format|
      if @thread_message.save
        format.html { redirect_to show_thread_message_url(id: @thread_message.id), notice: 'Thread message was successfully created.' }
        format.json { render :show, status: :created, location: @thread_message }
      else
        format.html { render :new }
        format.json { render json: @thread_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def reply
    @thread_message = ThreadMessage.new(thread_message_params)

    respond_to do |format|
      if @thread_message.save
        format.html { redirect_to show_thread_message_url(id: @thread_message.id), notice: 'Thread message was successfully created.' }
        format.json { render :show, status: :created, location: @thread_message }
      else
        format.html { render :new }
        format.json { render json: @thread_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thread_messages/1
  # PATCH/PUT /thread_messages/1.json
  def update
    respond_to do |format|
      if @thread_message.update(thread_message_params)
        format.html { redirect_to show_thread_message_url(id: @thread_message.id), notice: 'Thread message was successfully updated.' }
        format.json { render :show, status: :ok, location: @thread_message }
      else
        format.html { render :edit }
        format.json { render json: @thread_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_messages/1
  # DELETE /thread_messages/1.json
  def destroy
    @thread_message.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Thread message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread_message
      @thread_message = ThreadMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thread_message_params
      params.permit(:thread_message_id, :project_thread_id, :message, :user_id)
    end
end
