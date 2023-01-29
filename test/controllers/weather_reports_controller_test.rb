require "test_helper"

class WeatherReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_reports_index_url
    assert_response :success
  end

  test "should get new" do
    get weather_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get weather_reports_create_url
    assert_response :success
  end
end
