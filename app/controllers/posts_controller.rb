class PostsController < ApplicationController

    def index
        @posts = Post.all.order(id: "DESC")
    end

    def create
        post = Post.create(content: params[:content], checked: false)
        render json:{ post: post }
    end

    def checked
        post = Post.find(params[:id])
        # 変数postのcheckedカラムはboolean型の為、真理値が入っている
        if post.checked 
            # 既読(true)であれば、解除のためfalseへ
            post.update(checked: false)
        else
            # 未読(false)であれば、既読のためtrueへ
            post.update(checked: true)
        end
    
        # 更新後の真理値を変数itemへ格納
        item = Post.find(params[:id])
        # 変数itemのデータを変数postへ格納し、JSON形式で「checked.js」へ返しレンダリングする。
        render json: { post: item }
    end
end
