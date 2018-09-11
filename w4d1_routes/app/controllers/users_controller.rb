

class UsersController < ApplicationController

    def index 
      user = User.all
      render json: user
    end
  
    def create
      user = User.new(user_params)
      if user.save
        render json: user
      else
        render json: user.error.full_messages, status: :unprocessable_entity
      end
    end
    
    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: user.error.full_messages, status: :unprocessable_entity
      end
    end 
  
    def show
      users = User.find(params[:id])
      render json: users
    end
    
    def destroy
      user = User.find(params[:id])
      
      if user
        User.delete(user)
      else
        render json: user.error.full_messages, status: :unprocessable_entity
      end
    end
    
    private 
    
    def user_params
      params.require(:user).permit(:username)
    end

end

# Prefix Verb   URI Pattern                                                                              Controller#Action
#                    users GET    /users(.:format)                                                                         users#index
#                          POST   /users(.:format)                                                                         users#create
#                 new_user GET    /users/new(.:format)                                                                     users#new
#                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                     user GET    /users/:id(.:format)                                                                     users#show
#                          PATCH  /users/:id(.:format)                                                                     users#update
#                          PUT    /users/:id(.:format)                                                                     users#update
#                          DELETE /users/:id(.:format)