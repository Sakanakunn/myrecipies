class RecipesController < ApplicationController

    def index
        @recipes = Recipe.paginate(page: params[:page],per_page: 4 )
    end

    def show
        @recipe = Recipe.find(params[:id])
        @chef = @recipe.chef
    end

    def new
       @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.find(session[:chef_id])

        if @recipe.save
            flash[:success] = "Your recipe was created successfully!"
            redirect_to recipes_path
        else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)

           flash[:success] = "Your recipe was updated succesfully!"
           redirect_to recipe_path(params[:id])
        else
            render :edit
        end
    end

    def like
        @recipe = Recipe.find(params[:id])
        like = Like.create(like: params[:like] ,recipe: @recipe, chef: Chef.first)
        @recipe.like = 0
        if like.valid?
            flash[:success] = "You selection was successfull!"
            redirect_to :back
        else
            flash[:danger] ="You did'nt add like or dislike button once more time"
            redirect_to  :back

        end
    end

        private
            def recipe_params
                params.require(:recipe).permit(:name,:summary,:description)
            end
end