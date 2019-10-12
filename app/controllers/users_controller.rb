class UsersController < ApplicationController

    #signup 
    get '/signup' do 
        erb :"users/new"
    end 

    #create user
    post '/users' do 
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id 
            redirect "/blogs"
        else
            erb :"users/new"
        end 
    end 
end 