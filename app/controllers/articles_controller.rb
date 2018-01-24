class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "root", password: "admin", except: [:index, :show]
	
	def index
    	@articles = Article.all
    	# GuestsCleanupJob.perform_later(job())
    	p "1111111111111111111111"
    	# jid = GuestsCleanupJob.perform_later(1)
    	# jid = GuestsCleanupJob.perform_later(2)
    	# jid = GuestsCleanupJob.set(wait: 10.second).perform_later(1)
    	jid = GuestsCleanupJob.set(wait: 2.second).perform_later(2)

    	
    	# p jid
    	p jid.provider_job_id

    	# GuestsCleanupJob.set(wait: 10.second).perform_later("prac002", "a", "c", "gggg")
  	end

  	def edit
	  @article = Article.find(params[:id])
	end

	def show
    	@article = Article.find(params[:id])
  	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
	    	redirect_to @article
	  	else
	    	render 'new'
	  	end
	end

	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
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
  	def article_params
    	params.require(:article).permit(:title, :text)
  	end

  	def job
  		 p "job job job job job job"
  	end
end
