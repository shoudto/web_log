class SessionsController < ApplicationController 

    #login form


    #put_in_session


    #logout
    get '/logout' do 
        session.destroy
        redirect "/"
    end 
end 