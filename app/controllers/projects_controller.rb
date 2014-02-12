class ProjectsController < ApplicationController

  # GET /projects
  # GET /projects.json
  def index
    #if user has signed in and the user is admin
    #get all projects in the database
    #else only show the projects belong to the current user
    if signed_in? and is_admin?
      @projects = Project.all
    else
      @projects = Project.find_all_by_user_id(current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  #Requests the page that displays information about the selected project
  # GET /projects/1
  # GET /projects/1.json
  def show
    #get project by project id
    @project = Project.find(params[:id])

    #get all deliverables belong to the project
    @deliverable = Deliverable.find_all_by_project_id(@project.id)

    #get all project phases belong to the project
    @project_phases = LifecyclePhase.find_all_by_lifecycle_id(@project.lifecycle_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  #show all project in user's project page
  def assign
    #if user has signed in and is admin
    if signed_in? and is_admin?
      @projects = Project.all
    else
      @projects = Project.find_all_by_user_id(current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def assign_project
    @project = Project.find_by_id(params[:project_id])
    @user = User.find_by_id(params[:uid])
    if not @project.users.find_by_id(@user.id)
      @project.users << @user
    end
    redirect_to @user, notice: 'Project was successfully assigned!'
  end

  # Requests data from /projects/new
  # GET /projects/new
  # GET /projects/new.json
  def new
    @uid = params[:uid]
    @project = User.find(@uid).projects.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/id/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      #if the project exist, can not create it
      project_exist = Project.find_by_name(@project.name)
      if project_exist
        redirect_to user_url(current_user), :notice => "This project exists, can not create it!!"
        return
      end

      if @project.save
        @project.users << current_user
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    deliverables = @project.deliverables
    #can not delete a non-empty project
    if deliverables.count() != 0
      redirect_to user_url(current_user), :notice => "Can not delete a non-empty project!!"
      return
    else
      @project.destroy
    end


    respond_to do |format|
      format.html { redirect_to user_url(current_user) }
      format.json { head :no_content }
    end
  end
end
