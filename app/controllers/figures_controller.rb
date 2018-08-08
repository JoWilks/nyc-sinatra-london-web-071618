class FiguresController < ApplicationController


  get '/figures' do
    @figures = Figure.all
      erb :"/figures/index"
  end

    get "/figures/new" do
      @titles = Title.all
      @landmarks= Landmark.all
      erb :"/figures/new"
    end

    post "/figures" do
      #create figure
      figure = Figure.create(name: params["figure_name"])

      #associate ticked titles with figure
      if params["title_ids"] != nil
        array_titles = params["title_ids"]
        array_titles.each {|title_id| figure.titles << Title.find(title_id)}
      end
      #create new title and associate with figure if new title filled
      if params["title_name"] != nil
        new_title = Title.create(name: params["title_name"])
      end
      #associate ticked landmarks with figure
      if params["landmark_ids"] != nil
        array_landmarks = params["landmark_ids"]
        array_landmarks.each {|landmark_id| figure.landmarks << Landmark.find(landmark_id)}
      end
      #create new landmark and associate with figure if new title filled
      if params["landmark_name"] != nil
        new_landmark = Landmark.create(name: params["landmark_name"], year_completed: params["year_completed"])
      end

      redirect "/figures/#{figure.id}"
    end

    get '/figures/:id' do
     @figure = Figure.find(params[:id])
    erb :"/figures/show"
    end

    get "/figures/:id/edit" do
    @titles = Title.all
    @landmarks= Landmark.all
    @figure = Figure.find(params["id"])
    erb :"/figures/edit"
    end

    patch "/figures/:id" do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    redirect "/figures/#{figure.id}"
    end

end
