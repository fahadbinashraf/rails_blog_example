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
    
    def create
        @article = Article.new(aritcle_params)

        if @article.save
            redirect_to @article
        else
            # the render method is used so that the article object is passed to the new template
            render 'new' 
        end
    end
    
    private
        def aritcle_params
            params.require(:article).permit(:title, :text)
        end
end
