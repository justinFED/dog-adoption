class AdoptionRequestConfirmationMailer < ApplicationMailer
    def confirmation_email(user, dog)
      @user = user
      @dog = dog
      mail(to: @user.email, subject: 'Your Adoption Request Submission')
    end

    def approval_email(user, dog)
      @user = user
      @dog = dog
      mail(to: @user.email, subject: 'Adoption Request Approved')
    end
  
    def decline_email(user, dog)
      @user = user
      @dog = dog
      mail(to: @user.email, subject: 'Adoption Request Declined')
    end
    
  end