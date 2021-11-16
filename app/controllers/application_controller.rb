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
      start_date: Time.new(params[:start_date].slice(0,4), params[:start_date].slice(5,7),params[:start_date].slice(8,10)),
      end_date: Time.new(params[:end_date].slice(0,4), params[:end_date].slice(5,7),params[:end_date].slice(8,10))
    )
    trip.genDays
    trip.to_json
  end

  post "/activities" do
    a = Activity.create(
      name: params[:name],
      cost: params[:cost],
      duration: params[:duration],
      day_id: params[:day_id]
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
