class AdhocDeliverablesController < ApplicationController

  def index
    # for fixing warning
    # restrict auto-generated routes adhoc_deliverables
  end

  # GET /adhoc_deliverables/id
  # GET /adhoc_deliverables/id.json
  def show
    #find Adhoc Deliverable by deliverable id
    @adhoc_deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adhoc_deliverable }
    end
  end

  # GET /adhoc_deliverables/project_id/:project_id/lifecycle_phase_id/:lifecycle_phase_id/deliverable_type_id/:deliverable_type_id/new/
  def new
    #new an adhoc deliverable
    @adhoc_deliverable = Deliverable.new

    @project = Project.find_by_id(params[:project_id])
    #get the lifecycle phase by lifecycle_phase_id, lifecycle_phase_id is got from URL
    @lifecycle_phase = LifecyclePhase.find_by_id(params[:lifecycle_phase_id])
    #get the deliverable type by deliverable_type_id, deliverable_type_id is got from URL
    @deliverable_type = DeliverableType.find_by_id(params[:deliverable_type_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adhoc_deliverable }
    end
  end

  # Requests the page that helps edit the selected adhoc_deliverable
  # GET /adhoc_deliverables/id/edit
  def edit
    #find adhoc deliverable to edit
    @adhoc_deliverable = Deliverable.find(params[:id])
  end

  # POST /adhoc_deliverables
  # POST /adhoc_deliverables.json
  def create
    #the params will be passed by default
    @adhoc_deliverable = Deliverable.new(params[:adhoc_deliverable])

    respond_to do |format|
      #save the data into database
      if @adhoc_deliverable.save
        format.html { redirect_to @adhoc_deliverable, notice: 'AdhocDeliverable was successfully created.' }
        format.json { render json: @adhoc_deliverable, status: :created, location: @adhoc_deliverable }
      else
        format.html { render "new" }
        format.json { render json: @adhoc_deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adhoc_adhoc_deliverables/id
  # PUT /adhoc_deliverables/id.json
  def update
    @adhoc_deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      if @adhoc_deliverable.update_attributes(params[:adhoc_deliverable])
        format.html { redirect_to @adhoc_deliverable, notice: 'AdhocDeliverable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @adhoc_deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adhoc_deliverables/id
  # DELETE /adhoc_deliverables/id.json
  def destroy
    @adhoc_deliverable = Deliverable.find(params[:id])
    #delete adhoc deliverable from database
    @adhoc_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to adhoc_deliverables_url }
      format.json { head :no_content }
    end
  end

end
