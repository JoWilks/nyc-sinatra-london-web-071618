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
      figure = Figure.create(name: params["figure"]["name"])

      #associate ticked titles with figure
      if params["figure"]["title_ids"] != nil
        array_titles = params["figure"]["title_ids"]
        array_titles.each {|title_id| figure.titles << Title.find(title_id)}
      end
      #create new title and associate with figure if new title filled
      if params["title"]["name"] != nil
        new_title = Title.create(name: params["title"]["name"])
        figure.titles << new_title
      end
      #associate ticked landmarks with figure
      if params["figure"]["landmark_ids"] != nil
        array_landmarks = params["figure"]["landmark_ids"]
        array_landmarks.each {|landmark_id| figure.landmarks << Landmark.find(landmark_id)}
      end
      #create new landmark and associate with figure if new title filled
      if params["landmark"]["name"] != nil
        new_landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
        figure.landmarks << new_landmark
      end

      redirect "/figures/#{figure.id}"
    end

    get '/figures/:id' do
     @figure = Figure.find(params[:id])
     @titles = @figure.titles
     @landmarks = @figure.landmarks
    erb :"/figures/show"
    end

    get "/figures/:id/edit" do
    @titles = Title.all
    @landmarks= Landmark.all
    @figure = Figure.find(params["id"])
    erb :"/figures/edit"
    end

    patch "/figures/:id" do
      #create figure
      figure = Figure.find(params["id"])
      figure.update(name: params["figure"]["name"])

      #associate ticked titles with figure
      if params["figure"]["title_ids"] != nil
        array_titles = params["figure"]["title_ids"]
        array_titles.each {|title_id| figure.titles << Title.find(title_id)}
      end
      #create new title and associate with figure if new title filled
      if params["title"]["name"] != nil
        new_title = Title.create(name: params["title"]["name"])
        figure.titles << new_title
      end
      #associate ticked landmarks with figure
      if params["figure"]["landmark_ids"] != nil
        array_landmarks = params["figure"]["landmark_ids"]
        array_landmarks.each {|landmark_id| figure.landmarks << Landmark.find(landmark_id)}
      end
      #create new landmark and associate with figure if new title filled
      if params["landmark"]["name"] != nil
        new_landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
        figure.landmarks << new_landmark
      end

      redirect "/figures/#{figure.id}"
    end

end

# {"figure"=>{"name"=>"Bob", "landmark_ids"=>["1"]},
#  "title"=>{"name"=>"Dr"},
#  "landmark"=>{"name"=>"", "year_completed"=>""}}
