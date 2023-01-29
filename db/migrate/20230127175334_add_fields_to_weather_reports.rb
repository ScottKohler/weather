
#rails g migration AddFieldsToWeatherReports humidy:string temp_f:string wind_mph:string

class AddFieldsToWeatherReports < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_reports, :humidity, :string
    add_column :weather_reports, :temp_f, :string
    add_column :weather_reports, :wind_mph, :string
  end
end
