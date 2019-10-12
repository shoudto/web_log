class BlogsController < ApplicationController

     #index
     get '/blogs' do 
        @blogs = Blog.all 

        erb :"blogs/index"
    end 

    #new 
    get '/blogs/new' do 
        @users = User.all

        erb :"blogs/new"
    end 

    #create
    post '/blogs' do 
        user = User.find_by_id(params[:user_id])
        @blog = user.blogs.build(params)

        if @blog.save
            redirect "/blogs"
        else
            redirect "/blogs/new"
        end 
    end 

    #show
    get '/blogs/:id' do 
        @blog = Blog.find_by_id(params[:id])

        if @blog 
            erb :"blogs/post"
        else
            redirect "/blogs"
        end 
    end 

    #edit
    get '/blogs/:id/edit' do 
        @blog = Blog.find_by_id(params[:id])

        erb :"blogs/edit"
    end 

    #update
    patch "/blogs/:id" do 
        @blog = Blog.find_by_id(params[:id])

        if @blog.update(title: params[:title], body: params[:body])
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