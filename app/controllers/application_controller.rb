class ApplicationController < ActionController::Base
  def addition_form
    render("add_templates/new_add.html.erb")
  end
  
  def addition_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}
    @operation = "Addition"
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f

    @result = @first + @second

    render("add_templates/results.html.erb")
  end

  def subtraction_form
    render("add_templates/new_subtract.html.erb")
  end

  def subtraction_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}
    @operation = "Subtraction"
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f

    @result = @second - @first

    render("add_templates/results.html.erb")
  end

  def multiplication_form
    render("add_templates/new_multiply.html.erb")
  end

  def multiplication_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}
    @operation = "Multiplication"
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f

    @result = @second * @first

    render("add_templates/results.html.erb")
  end

  def division_form
    render("add_templates/new_divide.html.erb")
  end

  def division_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}
    @operation = "Division"
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f

    @result = @first / @second

    render("add_templates/results.html.erb")
  end

  def street_to_coords_form
    render("weather_templates/street_to_coords_form.html.erb")
  end

  def street_to_coords_results
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}

    @street_address = params.fetch("user_street_address")

    @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

    @raw_json_string = open(@maps_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results_array = @parsed_json.fetch("results")

    @first_result = @results_array.at(0)
    
    @geometry_hash = @first_result.fetch("geometry")

    @location_hash = @geometry_hash.fetch("location")

    @latitude = @location_hash.fetch("lat")
    @longitude = @location_hash.fetch("lng")

    render("weather_templates/street_to_coords_results.html.erb")
  end

  def coords_to_weather_form
    render("weather_templates/coords_to_weather_form.html.erb")
  end

  def coords_to_weather_results
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}

    @latitude = params.fetch("user_latitude")
    @longitude = params.fetch("user_longitude")

    @ds_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/"+@latitude+","+@longitude

    @raw_json_string = open(@ds_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @current = @parsed_json["currently"]
    minutely = @parsed_json["minutely"]
    hourly = @parsed_json["hourly"]
    daily = @parsed_json["daily"]

    @temperature = @current["temperature"]
    @summary = @current["summary"]

    @hr_outlook = minutely["summary"]
    @day_outlook = hourly["summary"]
    @week_outlook = daily["summary"]

    render("weather_templates/coords_to_weather_results.html.erb")
  end

  def street_to_weather_form
    render("weather_templates/street_to_weather_form.html.erb")
  end

  def street_to_weather_results
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}
    @street_address = params.fetch("user_street_address")
    @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"
    @raw_json_string = open(@maps_url).read
    @parsed_json = JSON.parse(@raw_json_string)
    @results_array = @parsed_json.fetch("results")
    @first_result = @results_array.at(0)
    @geometry_hash = @first_result.fetch("geometry")
    @location_hash = @geometry_hash.fetch("location")
    @latitude = @location_hash.fetch("lat").to_s
    @longitude = @location_hash.fetch("lng").to_s

    @ds_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/"+@latitude+","+@longitude

    @raw_json_string = open(@ds_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @current = @parsed_json["currently"]
    minutely = @parsed_json["minutely"]
    hourly = @parsed_json["hourly"]
    daily = @parsed_json["daily"]

    @temperature = @current["temperature"]
    @summary = @current["summary"]

    @hr_outlook = minutely["summary"]
    @day_outlook = hourly["summary"]
    @week_outlook = daily["summary"]

    render("weather_templates/street_to_weather_results.html.erb")
  end
end
