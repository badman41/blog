class EntriesController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy
  layout false
  layout 'application', :except => :show

  def show
    @entry = Entry.find_by id: params[:id]
    @comments = Comment.by_entry_id @entry.id
    if logged_in?
      @comment = current_user.comments.build
      @comment.entry_id =  @entry.id
    end
    render :layout => false
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.build entry_params
    if @entry.save
      flash[:success] = t ".flash_success"
      redirect_to root_url
    else
      @feed_items = []
      render :new
    end
  end

  def destroy
    if @entry.destroy
      flash[:success] = t ".flash_success"
      redirect_to request.referrer || root_url
    else
      flash[:error] = t ".flash_error"
    end
  end

  private

  def entry_params
    params.require(:entry).permit :content, :title, :picture
  end

  def correct_user
    @entry = current_user.entries.find_by id: params[:id]
    redirect_to root_url unless @entry
  end
end
