class WeatherReport < ApplicationRecord

# --------------------------------------------------------------------------
# use this format and integrate into application
#WeatherReport.where(WeatherReport.arel_table[:created_at].gt(3.minutes.ago)  # ?? .where sipcode == :zipcde ??
# --------------------------------------------------------------------------


  def self.find_by_zipcode zip_code
    
    self.where(WeatherReport.arel_table[:created_at].gt(30.minutes.ago))
        .where("zip_code = #{zip_code}")
        .select(:id, :zip_code, :created_at, :updated_at, :response_text, :humidity, :temp_f, :wind_mph, :location_name)
    # ... or create a scope for the expiration logic
  end

end

