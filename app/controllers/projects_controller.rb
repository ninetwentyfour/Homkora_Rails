class ProjectsController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :json, :csv
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where( {:user_id => current_user._id} ).paginate(:page => params[:page], :per_page => 10)

    respond_with(@projects)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_with(@project)
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_with(@project)
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    # @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        # format.json { head :no_content }
        format.json { render json: @project, location: @project }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
  def search
    @projects = Project.search_tank(params[:q],  :conditions => {:user_id => current_user.id})

    render :action => 'index'
  end
  
  private
    def project_params
      params.require(:project).permit(:title, :description)
    end  
end
