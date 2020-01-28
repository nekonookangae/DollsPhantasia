class ApplicationController < ActionController::Base
  before_action :get_recent_posts, :get_archive_posts

  # 直近5件の記事を取得
  def get_recent_posts
    @recent_posts = Post.order(created_at: :desc).limit(5)
  end

  # 月別アーカイブを取得
  def get_archive_posts
    @archive_counts = Post.divide_monthly
  end
end
