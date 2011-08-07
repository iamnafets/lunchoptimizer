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
end
