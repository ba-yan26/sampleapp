class ListsController < ApplicationController
  def new
    @list = List.new
    # ビューへ渡すためのインスタンス変数に空のオブジェクトを生成する
  end
  
  def create
    list = List.new(list_params)
    # データを受け取り新規登録するためのインスタンス作成(ビューファイルへの引き渡しが必要ないのでローカル変数)
    list.save
    # データをデータベースに保存するためのsaveメソッド実行
    redirect_to list_path(list.id)
    
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end
  
  
  # 以下ストロングパラメーター
  private
  def list_params
    params.require(:list).permit(:title,:body)
  end
  
end
