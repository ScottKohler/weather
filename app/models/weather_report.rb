class WeatherReport < ApplicationRecord

    def self.find_by_zipcode zip_code
    p "you are in find_by_zipcode #{zip_code}"
    self.where(WeatherReport.arel_table[:created_at].gt(30.minutes.ago))
        .where("zip_code = #{zip_code}")
        .order(id: :desc)
        .drop(1)
  end

end

