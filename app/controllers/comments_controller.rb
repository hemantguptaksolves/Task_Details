class CommentsController < ApplicationController
  # before_action :authenticate_user!

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.create(comment_params)
  #   redirect_to post_path(@post)
  # end

  # before_action :set_article

  # def create
  #   @comment = Comment.create! text: params[:comment][:text], article: @article
  # end
  



  # def create
  #   @post = Post.find_by(slug: params[:comment][:post_id])
  #   @comment = @post.comments.build(comment_params)
  #   if @comment.save
  #     ActionCable.server.broadcast "comments_#{@post.slug}_channel", render(partial: 'blog/comments/comment', object: @comment)
  #   else
  #     flash[:alert] = "There was an error creating the comment.  Please try again."
  #     redirect_to blog_post_path(@post.slug)
  #   end
  # end


  # def subscribed
  #   stream_from "comments_#{params['post_slug']}_channel"
  # end

  # def unsubscribed
  # end

  before_action :find_post, :authenticate_user!
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @post.comments.create(comment_params)
   # @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment Deleted.' }
      format.js
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end



  

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to post_path(@post)
  # end
 
  # private
  #   def comment_params
  #     params.require(:comment).permit(:body)
  #   end
  #   def set_article
  #     @article = Post.find(params[:post_id])
  #   end
end