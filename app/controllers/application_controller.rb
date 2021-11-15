class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Something"
  end

  get "/trips" do
    Trip.all.to_json
  end

  get "/trips/:id" do
    t = Trip.find(params[:id])
    t.to_json(include: { days: { include: :activities } })
  end

  post "/trips" do
    trip = Trip.create(
      name: params[:name],
      participants: params[:participants],
      budget: params[:budget],
      start_date: Time.at(params[:start_date]/1000.0),
      end_date: Time.at(params[:end_date]/1000.0)
    )
    trip.genDays
    trip.to_json
  end

  post "/activities" do
    a = Activity.create(
      name: params[:name],
      price: params[:price],
      duration: params[:duration],
      day: params[:day]
    )
    a.to_json
  end

  delete "/activities/:id" do
    a = Activity.find(params[:id])
    a.destroy
    a.to_json
  end

  patch "/activities/:id" do
    a = Activity.find(params[:id])
    a.update(
      name: params[:name],
      price: params[:price],
      duration: params[:duration],
      day: params[:day]
    )
  end

end
