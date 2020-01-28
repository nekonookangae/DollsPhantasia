class CategoriesController < ApplicationController
  before_action :set_search

  # カテゴリ別のpostページを作りたいだけなのでshow以外作らない
  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: @category.id).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  private
  # サイドバーの検索フォームで検索したとき、結果を返す
  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result.paginate(page: params[:page], per_page: 5)
  end
end
