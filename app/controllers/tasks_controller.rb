class TasksController < ApplicationController
	before_action :authenticate_user!


	def new
		@tasks=Task.new
	end

	def create
		# @task = Task.create(title: @title, description: @description)
		# @task = current_user.tasks.build(task_params)
		@task = Task.new(task_params)
		if @task.save
			redirect_to root_url, notic: "Successfully Create Task"
		else
			render 'new'
		end
	end

	private
	def task_params
		params.require(:task).permit(:title, :description)
	end
end
