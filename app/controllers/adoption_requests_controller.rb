class AdoptionRequestsController < ApplicationController 
  before_action :set_pending_request_count, only: [:index, :new, :create, :confirmation, :approve, :decline]

  def index
    @adoption_requests = AdoptionRequest.all
  end

  def new
    @adoption_request = AdoptionRequest.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @adoption_request = current_user.adoption_requests.build(adoption_request_params)
    @dog = Dog.find_by(id: @adoption_request.dog_id) # Find the dog by dog_id

    if @adoption_request.save
      redirect_to adoption_application_confirmation_path(dog_id: @dog.id), notice: 'Adoption request was successfully submitted.'
    else
      render :new
    end
  end

  def confirmation
    @dog = Dog.find_by(id: params[:dog_id])
  end

  def approve
    @adoption_request = AdoptionRequest.find(params[:id])
    if @adoption_request.update(isApproved: true)
      flash[:success] = "Adoption request approved successfully."
    else
      flash[:error] = "Failed to approve adoption request."
    end
    redirect_to adoption_requests_path
  end

  def decline
    @adoption_request = AdoptionRequest.find(params[:id])
    if @adoption_request.update(isApproved: false)
      flash[:success] = "Adoption request declined successfully."
    else
      flash[:error] = "Failed to decline adoption request."
    end
    redirect_to adoption_requests_path
  end

  private

  def adoption_request_params
    params.require(:adoption_request).permit(:occupation, :adoption_essay, :dog_id)
  end

  def set_pending_request_count
    @pending_request_count = AdoptionRequest.where(isApproved: nil).count
  end
end
