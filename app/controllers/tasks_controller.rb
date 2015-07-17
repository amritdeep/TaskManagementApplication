class TasksController < ApplicationController
	before_action :authenticate_user!

	def index
		@tasks = Task.where(user_id: current_user.id).all.order(created_at: :desc)
		@share_tasks=current_user.tasks.all.order(created_at: :desc)
	end

	def new
		@tasks=Task.new
	end

	def create
		@task = current_user.tasks.build(task_params)
		@task.user_id = current_user.id
		if @task.save
			redirect_to root_url, notic: "Successfully Create Task"
		else
			render 'new'
		end
	end

	def show
		@task=Task.where(id: params[:id])
	end

	def invite
		@user=User.new
	end

	def send_invitation
		@email=params[:user][:email]

		@task=Task.where(id: params[:id]).first
		@user=User.where(email: @email).first

		if @user.present?
			@user.tasks.append(@task)
			UserMailer.send_invitation(current_user, @user, @task)
		else
			@user=User.create(email: @email)
			if @user.save
				render 'invite'
			else
				@user.tasks.append(@task)
				UserMailer.send_invitation(current_user, @user, @task)
			end
		end
	end

	private
	def task_params
		params.require(:task).permit(:title, :description)
	end
end
