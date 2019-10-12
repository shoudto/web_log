class UsersController < ApplicationController

    #signup 
    get '/signup' do 
        erb :"users/new"
    end 

    #show
    post '/users' do 
        
    end 
end 