class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id], :include => :restaurants)
    @restaurants = 
      (Group.find :all,
        :include => [:restaurants, :users], :conditions => ['users.id = ? AND groups.id = ?',current_user.id,@group.id.to_s])
      .collect{|g| g.restaurants}.flatten.uniq.collect do |restaurant|
        rating = restaurant.ratings.where(:user_id => current_user, :end_date => nil).first
        {:restaurant => restaurant, :rating => (rating.nil? ? 50 : rating.rating)}
      end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new
    @restaurants = Restaurant.all(:order => 'name').collect { |r| [r.name, r.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @restaurants = Restaurant.all(:order => 'name').collect { |r| [r.name, r.id] }
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end

  # PUT /groups/join/1
  def join
    #TODO Eventually we'll probably check permissions here
    @group = Group.find(params[:id])
    respond_to do |format|
      if current_user.groups.include? @group
        # Do nothing, we're already in
        format.js { render :text => 'Failed' }
      else
        current_user.groups << @group
        format.js { render :text => 'Success' }
      end
    end
  end

  # PUT /groups/quit/1
  def quit
    #TODO Eventually we'll probably check permissions here
    @group = Group.find(params[:id])
    respond_to do |format|
      if current_user.groups.include? @group
        current_user.groups.delete @group
        format.js { render :text => 'Success' }
      else
        # Do nothing, we're not in anyways
        format.js { render :text => 'Failed' }
      end
    end
  end

  # POST /groups/joinbycode/PAREXPEDIA
  def joinbycode
    code = if params[:code].nil? then params[:code_form] else params[:code] end
    if not code.nil? then
      @group = Group.where("lower(code) = lower(:code)", { :code => code}).first
      if not @group.nil? then
        if not current_user.groups.include? @group then
					current_user.groups << @group
					flash[:notice] = 'Added to group "'+@group.name+'".'
				else
					flash[:error] = 'Already in group.'
				end
      else
				flash[:error] = 'No groups found with this code.'
      end
    end
  end

end
