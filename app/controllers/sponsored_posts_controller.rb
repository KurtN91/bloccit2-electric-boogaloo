class SponsoredPostsController < ApplicationController
  def show
         @sponsored_post = Sponsored.find(params[:id])
  end

  def new
         @topic = Topic.find(params[:topic_id])
              @sponsored_post = Sponsored.new
  end

  def edit
    @sponsored_post = Sponsored.find(params[:id])
  end

     def create
     @sponsored_post = Sponsored.new
     @sponsored_post.title = params[:post][:title]
     @sponsored_post.body = params[:post][:body]
     @topic = Topic.find(params[:topic_id])
 # #35
     @sponsored_post.topic = @topic

     if @sponsored_post.save
       flash[:notice] = "Post was saved."
 # #36
       redirect_to @sponsored_post
       redirect_to [@topic, @sponsored_post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end


     def update
     @sponsored_post = Sponsored.find(params[:id])
     @sponsored_post.title = params[:post][:title]
     @sponsored_post.body = params[:post][:body]
          @topic = Topic.find(params[:topic_id])
 # #35
     @sponsored_post.topic = @topic
 
     if @sponsored_post.save
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @sponsored_post]
           else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
    end
    
       def destroy
     @sponsored_post = Sponsored.find(params[:id])
 
 # #8
     if @sponsored_post.destroy
       flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully."
        redirect_to @sponsored_post.topic
           else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
    end
end
    