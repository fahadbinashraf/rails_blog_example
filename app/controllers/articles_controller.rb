class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])    
    end

    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(aritcle_params)

        if @article.save
            redirect_to @article
        else
            # the render method is used so that the article object is passed to the 'new' template
            render 'new' 
        end
    end
    
    def update
        @article = Article.find(params[:id])

        if(@article.update(aritcle_params))
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
        def aritcle_params
            params.require(:article).permit(:title, :text)
        end
end
