class ApplicationController < ActionController::Base
  def index
  end

  def task1
    @landlords = Landlord.first(10)
  end

  def task1_questions
  end
end
