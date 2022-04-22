Rails.application.routes.draw do

  
  get("/wizard_add", { :controller => "application", :action => "addition_results" })
  
  get("/add", { :controller => "application", :action => "addition_form" })

  get("/subtract", { :controller => "application", :action => "subtraction_form"})

  get("/wizard_subtract", { :controller => "application", :action => "subtraction_results" })

  get("/multiply", { :controller => "application", :action => "multiplication_form"})

  get("/wizard_multiply", { :controller => "application", :action => "multiplication_results" })

  get("/divide", { :controller => "application", :action => "division_form"})

  get("/wizard_divide", { :controller => "application", :action => "division_results" })

  get("/street_to_coords/results", { :controller => "application", :action => "street_to_coords_results" })
  
  get("/street_to_coords/new", { :controller => "application", :action => "street_to_coords_form" })

  get("/coords_to_weather/new", { :controller => "application", :action => "coords_to_weather_form" })

  get("/coords_to_weather/results", { :controller => "application", :action => "coords_to_weather_results" })

  get("/street_to_weather/new", { :controller => "application", :action => "street_to_weather_form" })

  get("/street_to_weather/results", { :controller => "application", :action => "street_to_weather_results" })

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
