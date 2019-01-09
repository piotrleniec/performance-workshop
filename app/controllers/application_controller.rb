class ApplicationController < ActionController::Base
  def index
  end

  def task1
    @landlords = Landlord.first(10)
  end

  def task1_questions
  end

  def task2
    @rows = []
    Room.first(1000).each do |room|
      @rows << [
        room.id,
        room.prices.minimum(:amount),
        room.prices.maximum(:amount)
      ]
    end
  end

  def task2_questions
  end
end
