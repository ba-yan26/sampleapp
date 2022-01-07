class ListsController < ApplicationController
  def new
    @list = List.new
    # ビューへ渡すためのインスタンス変数に空のオブジェクトを生成する
  end
  
  def create
    @list = List.new(list_params)
    # データを受け取り新規登録するためのインスタンス作成(ビューファイルへの引き渡しが必要ないのでローカル変数)
    # 
    if @list.save
    # データをデータベースに保存するためのsaveメソッド実行
      redirect_to list_path(@list.id)
    else
      render :new
    end
    
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    # 編集アクション
    @list = List.find(params[:id])
  end
  
  def update
    # 編集した項目の更新アクション
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list.id)
    else
      render :edit
    end
      
  end
  
  def destroy
    # 削除アクション
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  # 以下ストロングパラメーター
  private
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
  
end
