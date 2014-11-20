class FormsController < ApplicationController
	def index
		@forms=Form.all
	end
	
	def create
	@form = Form.new(form_params)
 
	@form.save
	redirect_to forms_path
	end
 
	def show
	@form = Form.find(params[:id])
	end
 
	def edit
	@form = Form.find(params[:id])
	end
 
	def update
	@form = Form.find(params[:id])
 
	if @form.update(form_params)
    redirect_to forms_path
	else
    render 'edit'
	end
	end
 
	def destroy
	@form = Form.find(params[:id])
	@form.destroy
 
	redirect_to forms_path
	end
  
private
  def form_params
    params.require(:form).permit(:comment, :title)
  end
end