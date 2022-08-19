class Api::V1::StatisticsController < ApplicationController
  def index
  end

  def show
  end

  def create
    # add a try except block to prevent failure
    begin
      @url = Url.find(params[:id])
      @statistic = @url.statistics.create({url_id:@url.id})
      return render json: {status: true, message: 'Statistic saved successfully'}
    rescue
      return render json: {
        status: false, 
        message: 'An error occured while saving the statistic for url' 
      }
    end
  end
end
