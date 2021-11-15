class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Something"
  end

  get "/trips" do
    Trip.all.to_json
  end

  post "/trips" do
    trip = Trip.create(
      name: params[:name],
      participants: params[:participants],
      budget: params[:budget],
      start_date: Time.at(params[:start_date]/1000.0),
      end_date: Time.at(params[:end_date]/1000.0)
    )
    trip.to_json
  end

end
