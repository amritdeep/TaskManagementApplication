class TasksController < ApplicationController
	before_action :authenticate_user!

	def index
		@tasks = Task.all.order(created_at: :desc)
	end

	def new
		@tasks=Task.new
	end

	def create
		@task = current_user.tasks.build(task_params)
		if @task.save
			redirect_to root_url, notic: "Successfully Create Task"
		else
			render 'new'
		end
	end

	def show
		@task=Task.where(id: params[:id])
	end

	private
	def task_params
		params.require(:task).permit(:title, :description)
	end
end
