class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @feed_items = current_user
                  .feed.all_order.paginate page: params[:page]
    else
    @feed_items =Entry.all_order.paginate page: params[:page]
    end
  end

  def help; end
end
