class SessionsController < ApplicationController 

    #login form
    get '/login' do 
        erb :"sessions/login"
    end

    #put_in_session
    post '/sessions' do 
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/blogs"
        else 
            redirect "/login"
        end 
    end 

    #logout
    get '/logout' do 
        session.destroy
        redirect "/"
    end 
end 