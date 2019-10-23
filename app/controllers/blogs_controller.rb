class BlogsController < ApplicationController

     #index
     get '/blogs' do
        if session[:user_id]
            @user = current_user
            @blogs = @user.blogs
            erb :"blogs/index"
        else 
            redirect "/signup"
        end 
    end 

    #new 
    get '/blogs/new' do 
        @users = User.all

        if logged_in?
            erb :"blogs/new"
        else 
            redirect '/login'
        end 
    end 

    #create
    post '/blogs' do
         @user = current_user
        # @user = User.find_by_id(params[:user_id])
        @blog = @user.blogs.build(params)
        
        if @blog.save
            redirect "/blogs"
        else
            redirect "/blogs/new"
        end 
    end

    #show
    get '/blogs/:id' do 
        @blog = Blog.find_by_id(params[:id])

        if logged_in? && @blog 
            erb :"blogs/post"
        else
            redirect "/blogs"
        end 
    end 

    #edit
    get '/blogs/:id/edit' do
        @blog = Blog.find_by_id(params[:id])
        
        if session[:user_id] == @blog.user_id
            erb :"blogs/edit"
        else
            redirect "/blogs"
        end 
    end 

    #update
    patch "/blogs/:id" do 
        @blog = Blog.find_by_id(params[:id])

        if @blog.update(title: params[:title], style: params[:style], brewery: params[:brewery], body: params[:body])
            redirect "/blogs/#{@blog.id}"
        else
            redirect "/blogs/#{@blog.id}/edit"
        end 
    end 

    #delete
    delete '/blogs/:id' do 
        Blog.destroy(params[:id])
        
        redirect "/blogs"
    end 
end 