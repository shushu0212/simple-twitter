class RepliesController < ApplicationController
  before_action :set_tweet

  def index
    @reply = Reply.new
    @user = current_user
    @replies = @tweet.replies 
  end

  def create
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user
    @reply.save!
    redirect_to tweet_replies_path(@tweet)
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def reply_params
    params.require(:reply).permit(:comment)
  end 

end
