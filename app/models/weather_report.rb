class WeatherReport < ApplicationRecord

    def self.find_by_zipcode zip_code
    p "you are in find_by_zipcode #{zip_code}"
    self.where(WeatherReport.arel_table[:created_at].gt(30.minutes.ago))
        .where("zip_code = #{zip_code}")
        .select(:id, :zip_code, :created_at, :updated_at, :response_text, :humidity, :temp_f, :wind_mph, :location_name)
  end

end

