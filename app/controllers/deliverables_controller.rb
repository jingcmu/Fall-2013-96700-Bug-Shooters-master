class DeliverablesController < ApplicationController

  # GET /deliverables
  # GET /deliverables.json
  def index
    #get the project id from URL
    @project_id = params[:project_id]
    #find all the deliverables belong to the project
    @deliverables = Deliverable.find_all_by_project_id(@project_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliverables }
    end
  end

  # GET /deliverables/id
  # GET /deliverables/id.json
  def show
    #get the deliverable id from URL
    @deliverable = Deliverable.find(params[:id])
    #get the deliverable type for the deliverable
    @deliverable_type = DeliverableType.find_by_id(@deliverable.deliverable_type_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deliverable }
    end
  end

  # GET /deliverables/project_id/:project_id/lifecycle_phase_id/:lifecycle_phase_id/deliverable_type_id/:deliverable_type_id/new/
  def new
    @deliverable = Deliverable.new
    #get the project by project_id, project_id is got from URL
    @project = Project.find_by_id(params[:project_id])
    #get the lifecycle phase by lifecycle_phase_id, lifecycle_phase_id is got from URL
    @lifecycle_phase = LifecyclePhase.find_by_id(params[:lifecycle_phase_id])
    #get the deliverable type by deliverable_type_id, deliverable_type_id is got from URL
    @deliverable_type = DeliverableType.find_by_id(params[:deliverable_type_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deliverable }
    end
  end

  # Requests the page that helps edit the selected deliverable
  # GET /deliverables/id/edit
  def edit
    @deliverable = Deliverable.find(params[:id])
    #get the project by project_id, project_id is got from @deliverable's attribute
    @project = Project.find_by_id(@deliverable.project_id)
    #get the lifecycle phase by lifecycle_id, lifecycle_id is got from @deliverable's attribute
    @lifecycle_phase = LifecyclePhase.find_by_id(@project.lifecycle_id)
    #get the deliverable type by deliverable_type_id, deliverable_type_id is got from @deliverable's attribute
    @deliverable_type = DeliverableType.find_by_id(@deliverable.deliverable_type_id)
  end

  # POST /deliverables
  # POST /deliverables.json
  def create
    @deliverable = Deliverable.new(params[:deliverable])

    #get deliverable type, unit of measure and project id
    @deliverable_type = DeliverableType.find_by_id(@deliverable.deliverable_type_id)
    @deliverable.unit_of_measure = @deliverable_type.unit_of_measure
    if @deliverable.unit_of_measure == nil
      @deliverable.unit_of_measure = params[:deliverable][:unit_of_measure]
    end
    @deliverable.project_id = params[:deliverable][:project_id]

    respond_to do |format|
      deliverable_exist = Deliverable.find_by_name(@deliverable.name)
      if deliverable_exist
        redirect_to user_path(current_user), :notice => "This deliverable exists, can not create it!!"
        return
      end

      #save deliverable data into database
      if @deliverable.save
        #if deliverable exist, can not create it
        format.html { redirect_to @deliverable, notice: 'Deliverable was successfully created.' }
        format.json { render json: @deliverable, status: :created, location: @deliverable }
      else
        format.html { render "new" }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deliverables/id
  # PUT /deliverables/id.json
  def update
    @deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      if @deliverable.update_attributes(params[:deliverable])
        format.html { redirect_to @deliverable, notice: 'Deliverable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverables/id
  # DELETE /deliverables/id.json
  def destroy
    @deliverable = Deliverable.find(params[:id])
    #delete deliverable from database
    @deliverable.destroy

    respond_to do |format|
      format.html { redirect_to "/deliverables/project_id/#{@deliverable.project_id}" }
      format.json { head :no_content }
    end
  end

  #GET /deliverables/deliverable_id/:deliverable_id/actual_effort/:actual_effort/log/
  def log
    deliverable = Deliverable.find(params[:deliverable_id])
    if deliverable  #if deliverable is found
        #get the actual effort from URL
        actual_effort = params[:actual_effort]
        #pass actual effort to deliverable
        deliverable.actual_effort = actual_effort
        #save data to database
        deliverable.save
        render json: "OK"
    end
  end

  #get deliverable's project id more conveniently
  def project_id
    return self.project_id
  end

end
