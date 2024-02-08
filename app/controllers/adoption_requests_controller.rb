class AdoptionRequestsController < ApplicationController 
 def index
    @adoption_requests = AdoptionRequest.all
  end

  def new
    @adoption_request = AdoptionRequest.new
    @dog = Dog.find(params[:dog_id]) # Assuming you are passing the dog_id parameter
    render 'adoption_requests/new_request'
  end

  def create
    @adoption_request = AdoptionRequest.new(adoption_request_params)
    @dog = Dog.find(params[:dog_id])

    if @adoption_request.save
    debugger

      redirect_to adoption_requests_path, notice: 'Adoption request was successfully created.'
    else
      render :new
    end
  end

  private

  def adoption_request_params
    debugger
    params.require(:adoption_request).permit(:occupation, :adoption_essay).merge(user_id: current_user.id, dog_id: params[:dog_id])
  end
 
end
