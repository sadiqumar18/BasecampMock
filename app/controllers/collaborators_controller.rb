class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  # GET /collaborators
  # GET /collaborators.json
  # def index
  #   @collaborators = Collaborator.all
  #   # print(@collaborators, ">>>>>>>>>>>><<<<<<<<<<<<<")
  # end

  # GET /collaborators/1
  # GET /collaborators/1.json
  def show
  end

  # GET /collaborators/new
  def new
    @collaborator = Collaborator.new
    @collaborators = Collaborator.where(project_id: params[:project_id] )
  end

  # GET /collaborators/1/edit
  def edit
  end

  # POST /collaborators
  # POST /collaborators.json
  def create
    if collaborator_params[:email].empty?
      return redirect_to request.referer, error: "Email field is required"
    end
    user = User.find_by(email: collaborator_params[:email])
    collaborator= Collaborator.find_by(project_id: params[:project_id], user_id: user.id )
    if collaborator
      return redirect_to request.referer, error: "User is already part of project"
    end
    @collaborator = Collaborator.new(user_id: user.id, project_id: params[:project_id])
    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to "/projects", notice: 'Collaborator was successfully created.' }
        format.json { render :show, status: :created, location: @collaborator }
      else
        format.html { redirect_to new_collaborator_url(), error: @collaborator.errors.messages.values }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborators/1
  # PATCH/PUT /collaborators/1.json
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to @collaborator, notice: 'Collaborator was successfully updated.' }
        format.json { render :show, status: :ok, location: @collaborator }
      else
        format.html { render :edit }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborators/1
  # DELETE /collaborators/1.json
  def destroy
    @collaborator.destroy
    respond_to do |format|
      format.html { redirect_to new_collaborator_url, notice: 'Collaborator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collaborator_params
      # print(params, ">>>>>>>>>>>><<<<<<<<<<<<<<<")
      params.fetch(:collaborator).permit(:email, :project_id, :id)
    end
end
