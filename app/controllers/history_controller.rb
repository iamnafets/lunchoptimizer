class HistoryController < ApplicationController
  def index
    #TODO: This should take parameters so that the back button works properly
    @year = DateTime.now.year
    @month = DateTime.now.month

    @beginning_date = Date.new(@year,@month,1)

    @lunches = current_user.lunches.where(['date BETWEEN ? AND ?',@beginning_date,@beginning_date+1.month])
  end

  def month
    @year = params[:year].to_i
    @month = params[:month].to_i

    render :layout => false
  end

  def edit
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @date = Date.new @year,@month,@day

    #TODO: This will need to be restricted to the groups that the user
    # currently belongs to
    @lunches = Lunch.where(:date => @date).collect {|l| [l.name, l.id]}
    @lunch = current_user.lunches.where(:date => @date).first
  end

  def update
    #TODO: This needs polish, it works, but the error messages don't
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @date = Date.new @year,@month,@day

    @lunch_id = params[:lunch_id].to_i
    @lunch = Lunch.find(@lunch_id)
    @existing_lunch = current_user.lunches.where(:date => @date)

    if @lunch.users.include? current_user
      @error = 'You already went to this lunch.'
    else
      @lunch.users << current_user
    end

    #TODO: We need to make sure we warn the user if we're taking them off of a previous lunch
    current_user.lunches.delete @existing_lunch unless @existing_lunch.nil?

    respond_to do |format|
      if not @error.nil?
        format.html { redirect_to(:action => 'edit', :year => @year, :month => @month, :day => @day, :error => @error) }
      else
        format.html { redirect_to(:action => 'edit', :year => @year, :month => @month, :day => @day) }
      end
      
    end
  end
end
