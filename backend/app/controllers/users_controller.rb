class UsersController < ApplicationController
    # Routings
        get "/users" do
           users = User.all
           users.to_json
        end

        post "/users" do
            user_name = params[:myusername]
            phone_ = params[:myphone]
            email_ = params[:myemail]

            if(user_name.present? && phone_.present? && email_.present?)
                check_email_exists = User.where(email: email_).count() #Integer 2,3,4,5
                 puts("XXXXXXXXXXXXXXXXX ", check_email_exists)

                 if check_email_exists < 1
                    user = User.create(username: user_name, email: email_, phone: phone_)
                    if user
                        message = {:succcess => "User created successfully!!"}
                        message.to_json
                    else
                        message = {:error => "Error saving user!"}
                        message.to_json
                    end
                else
                    message = {:error => "Email exists!"}
                    message.to_json
                end
            else
                message = {:error => "All fields should be field!"}
                message.to_json
            end
            
        end


        # delete
        delete "/users/:id" do
            count_users = User.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_users>0
                user = User.find(params[:id])
                user.destroy
                message = {:succcess => "User deleted successfully!!"}
                message.to_json

            else
                message = {:error => "User does not exist!"}
                message.to_json
            end


        end




    end