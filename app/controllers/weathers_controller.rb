class WeathersController < ApplicationController
  #before_action :set_weather, only:[:show, :edit, :update]

  def index
    #results
    @weather_reports = WeatherReport.all
  end

  def new
    #view to capture/submit city state zip
    Rails.logger.debug("In new()")
    @weather_report = WeatherReport.new
  end

  def create
    # Rails.logger.debug("In create()")
    # #@weather_report = WeatherReport.create
    # @weather_report = WeatherReport.new(weather_params)
    #   if(@weather_report.save)
    #     flash[:notice] = 'Runlog created successfully'
    #     redirect_to @weather_report
    #   else
    #     flash[:error] = 'WeatherReport was not created'
    #     render action: 'new'          
    #   end


    #weatherapi.com calls
    #save weather cache object
    #redirect to index

  end

  def show
    Rails.logger.debug("In show()")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weather_report }
    end
  end

  def update
    Rails.logger.debug("In update()")
  end

  private

  def weather_params
    params.require(:weather_report).permit(:response_text, :zip_code)
  end


  def set_weather
    @weather_report = WeatherReport.find(params[:id])
  end


end
