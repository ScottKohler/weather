class WeatherReport < ApplicationRecord

#   scope :show_cache, -> { where ( "created_at + 5.minutes > DateTime.now.new_offset(0)" )}
#  scope :show_cache, -> ()  { where ("created_at < ?",   DateTime.now.new_offset(0)  )   }
# reloadscope :show_cache, -> { where('created_at + ? > ?', 15.minutes , DateTime.now.new_offset(0)   )}
scope :show_cache, -> { where('? < (created_at + ?) ', DateTime.now.new_offset(0), 15.minutes    )}

#todo - update this scope with arel solution

# --------------------------------------------------------------------------
# use this format and integrate into aoolication
#WeatherReport.where(WeatherReport.arel_table[:created_at].gt(3.minutes.ago)  # ?? .where sipcode == :zipcde ??
# --------------------------------------------------------------------------


  def self.find_by_zipcode zip_code
    p "you are in find_by_zipcode #{zip_code}"
    self.where(WeatherReport.arel_table[:created_at].gt(30.minutes.ago))
        .where("zip_code = #{zip_code}")
        .select(:id, :zip_code, :created_at, :updated_at, :response_text, :humidity, :temp_f, :wind_mph, :location_name)
  end




end

