class PostsController < ApplicationController
    # Routings
    # Get all post
        get "/posts" do
            posts = Post.all
            posts.to_json(include: [:user, :comments])
         end

        #  get single post
        get "/posts/:id" do
            count_posts = Post.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_posts>0
                posts = Post.find_by(id: params[:id])
                posts.to_json
            else
                message = {:error => "post do not exist"}
                message.to_json
            end
         end

        # add post
         post "/posts" do
            title = params[:title]
            content = params[:content]
            user = params[:user]

            if(title.present? && content.present? && user.present?)
                post = Post.create(title: title, content: content, user_id: user)
                if post
                    message = {:succcess => "Post created successfully!!"}
                    message.to_json
                else
                    message = {:error => "Error saving post!"}
                    message.to_json
                end
            else
                message = {:error => "All fields should be field!"}
                message.to_json
            end
        end

        #edit
        patch '/posts/:id' do
            check_post_existence = Post.exists?(id: params[:id]) #true/ false
            if check_post_existence
                title = params[:title]
                content = params[:content]
                user = params[:user]
                if(title.present? && content.present? && user.present?)
                    # updating
                    post = Post.find_by(id: params[:id])
                    post.update(title: title, content: content, user_id: user)
                    message = {:success => "Post updated successfully!"}
                    message.to_json
                else
                    message = {:error => "All field should be field!"}
                    message.to_json
                end

            else
                message = {:error => "The post does not exist!"}
                message.to_json
            end
        end



          # delete
          delete "/posts/:id" do
            count_posts = Post.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_posts>0
                post = Post.find(params[:id])
                post.destroy
                message = {:succcess => "Post deleted successfully!!"}
                message.to_json

            else
                message = {:error => "Post does not exist!"}
                message.to_json
            end


        end


        
    end