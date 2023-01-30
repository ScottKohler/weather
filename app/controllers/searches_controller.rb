class SearchesController < ApplicationController

  require 'uri'
  require 'net/http'

  def new 
    render :search
  end  

  

  def search

    api_str = "http://api.weatherapi.com/v1/current.json?key=d9f9991ee0ba4671823162624232401&q=#{params[:zip]}&aqi=no"  #this is working

    zip_code = "#{params[:zip]}"
    uri = URI(api_str)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)

    @results = res.body
    @results = JSON.parse @results.gsub('=>', ':')

    #save to cache
    unless zip_code.nil?  
      @humidity = @results["current"]["humidity"]
      @temp_f = @results["current"]["temp_f"]
      @wind_mph = @results["current"]["wind_mph"]
      @zip_code = @results["current"]["zip code"]
      @location_name = @results["location"]["name"]
      
      #save these api fields for future cache recall
      wr = WeatherReport.new( :response_text => @results, 
                              :zip_code => zip_code, 
                              :humidity => @humidity, 
                              :temp_f => @temp_f,  
                              :wind_mph => @wind_mph, 
                              :location_name => @location_name )  
      wr.save

      @cached_reports = WeatherReport.find_by_zipcode zip_code  #add .show_cache here?
    end  
    render :search_results 
  end
end