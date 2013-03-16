class TimersController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :json, :csv
  
  # GET /timers
  # GET /timers.json
  def index
    @timers = Timer.any_of(
      { :project_id.in => current_user.projects.map{ |u| u._id } }
    ).paginate(:page => params[:page], :per_page => 10)
    
    respond_with(@timers)
  end

  # GET /timers/1
  # GET /timers/1.json
  def show
    @timer = Timer.find(params[:id])

    respond_with(@timer)
  end

  # GET /timers/new
  # GET /timers/new.json
  def new
    @timer = Timer.new

    respond_with(@timer)
  end

  # GET /timers/1/edit
  def edit
    @timer = Timer.find(params[:id])
  end

  # POST /timers
  # POST /timers.json
  def create
    @timer = Timer.new(params[:timer])

    respond_to do |format|
      if @timer.save
        format.html { redirect_to @timer, notice: 'Timer was successfully created.' }
        format.json { render json: @timer, status: :created, location: @timer }
      else
        format.html { render action: "new" }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timers/1
  # PUT /timers/1.json
  def update
    @timer = Timer.find(params[:id])

    respond_to do |format|
      if @timer.update_attributes(params[:timer])
        format.html { redirect_to @timer, notice: 'Timer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timers/1
  # DELETE /timers/1.json
  def destroy
    @timer = Timer.find(params[:id])
    @project = Project.find(@timer.project_id)
    
    @timer.destroy
    @project.update_project_time
    
    respond_to do |format|
      format.html { redirect_to timers_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:q].blank?
      @timers = Timer.any_of(
        { :project_id.in => current_user.projects.map{ |u| u._id } }
      ).paginate(:page => params[:page], :per_page => 10)
    else
      @timers = Timer.any_of(
        { :project_id.in => current_user.projects.map{ |u| u._id } }
      ).search_tank(params[:q])
    end

    render :action => 'index'
  end
end
