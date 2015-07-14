class TasksController < ApplicationController
	before_action :authenticate_user!


	def new
		@tasks=Task.new
	end

	def create
		binding.pry
		# @task = Task.create(title: @title, description: @description)
		@task = current_user.tasks.build(task_params)
	end

	private
	def task_params
		params.require(:task).permit(:title, :description)
	end
end
