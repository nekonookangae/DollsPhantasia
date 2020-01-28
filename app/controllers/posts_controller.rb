class PostsController < ApplicationController
  before_action :set_search
  before_action :authenticate_admin_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    # @post以外の同カテゴリの記事を6件取得し、"合わせて読みたい"に表示
    @post = Post.find(params[:id])
    @related_posts = Post.where(category_id: @post.category_id).where.not(id: @post.id).order(created_at: :desc).limit(6)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def archive
    @yyyymm = params[:yyyymm]
    # 取得した年月と同じ月の記事を取得
    date = @yyyymm[0, 4] + '-' + @yyyymm[4, 2] + '-1'
    @archive_posts = @posts.where(created_at: date.in_time_zone.all_month)
                           .paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end

  private

  # strong parameters
  def post_params
    params.require(:post).permit(:title, :category_id, :image, :content)
  end

  def post_path_with_search_params
    URI(request.referer).path == '/posts' ? request.referer : posts_path
  end

  # サイドバーの検索フォームで検索したとき、結果を返す
  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
end
