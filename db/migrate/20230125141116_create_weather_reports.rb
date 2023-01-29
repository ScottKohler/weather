class CreateWeatherReports < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_reports do |t|
      t.string :response_text
      t.string :zip_code

      t.timestamps
    end
  end
end
