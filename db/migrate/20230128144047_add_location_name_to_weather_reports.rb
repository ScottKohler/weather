# rails g migration AddLocationNameToWeatherReports location_name:string

class AddLocationNameToWeatherReports < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_reports, :location_name, :string
  end
end
