class HistoryController < ApplicationController
  def index
    @year = DateTime.now.year
    @month = DateTime.now.month

    @events = [
      {:name => 'Bamboo Garden', :company => 'Pariveda Expedia Group', :date => DateTime.new(2011,8,5)},
      {:name => 'Jimmy Johns', :company => 'Pariveda Office Group', :date => DateTime.new(2011,8,2)},
      ]
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

    @lunch_id = nil
  end

  def update
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @date = Date.new @year,@month,@day

    @lunch_id = params[:lunch_id].to_i
    @lunch = Lunch.find(@lunch_id)

    if @lunch.users.include? current_user
      @message = 'You already went to this lunch.'
    else
      @lunch.users << current_user
    end

    respond_to do |format|
      
    end

  end
end
