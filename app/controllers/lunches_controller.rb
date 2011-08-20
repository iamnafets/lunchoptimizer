class LunchesController < ApplicationController
  # GET /lunches
  # GET /lunches.xml
  def index
    @lunches = Lunch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lunches }
    end
  end

  # GET /lunches/1
  # GET /lunches/1.xml
  def show
    @lunch = Lunch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lunch }
    end
  end

  # Setup private variables for the groups and restaurants
  def setup_groups_and_restaurants
    @restaurants = Restaurant.all(:order => 'name').collect { |r| [r.name, r.id] }
    @restaurants.unshift ['*Optimized', -1]
    @groups = current_user.groups(:order => 'name').collect { |g| [g.name, g.id]}
  end

  # GET /lunches/new
  # GET /lunches/new.xml
  def new
    @lunch = Lunch.new(:restaurant_id => -1, :date => DateTime.now)
    setup_groups_and_restaurants

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lunch }
    end
  end

  # GET /lunches/1/edit
  def edit
    @lunch = Lunch.find(params[:id])
  end

  # POST /lunches
  # POST /lunches.xml
  def create
    @lunch = Lunch.new(params[:lunch])
    setup_groups_and_restaurants

    respond_to do |format|
      if @lunch.save
        format.html { redirect_to(@lunch, :notice => 'Lunch was successfully created.') }
        format.xml  { render :xml => @lunch, :status => :created, :location => @lunch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lunch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lunches/1
  # PUT /lunches/1.xml
  def update
    @lunch = Lunch.find(params[:id])
    setup_groups_and_restaurants

    respond_to do |format|
      if @lunch.update_attributes(params[:lunch])
        format.html { redirect_to(@lunch, :notice => 'Lunch was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lunch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lunches/join/1
  def attend
    #TODO Eventually we'll probably check permissions here
    @lunch = Lunch.find(params[:id])
    respond_to do |format|
      if current_user.lunches.include? @lunch
        # Do nothing, we're already in
        format.js { render :text => 'Failed' }
      else
        current_user.lunches << @lunch
        format.js { render :text => 'Success' }
      end
    end
  end

  # PUT /lunches/quit/1
  def unattend
    #TODO Eventually we'll probably check permissions here
    @lunch = Lunch.find(params[:id])
    respond_to do |format|
      if current_user.lunches.include? @lunch
        current_user.lunches.delete @lunch
        format.js { render :text => 'Success' }
      else
        # Do nothing, we're not in anyways
        format.js { render :text => 'Failed' }
      end
    end
  end

  # DELETE /lunches/1
  # DELETE /lunches/1.xml
  def destroy
    @lunch = Lunch.find(params[:id])
    @lunch.destroy

    respond_to do |format|
      format.html { redirect_to(lunches_url) }
      format.xml  { head :ok }
    end
  end
end
