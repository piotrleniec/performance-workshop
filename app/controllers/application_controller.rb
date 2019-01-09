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

  def task3
    @result1 = Room.where('square_meters > ?', 20).count
    @result2 = Room.where(furnished: true).where('square_meters > ?', 20).count
    @result3 = Residence.joins(:rooms).where('rooms.square_meters > ?', 55).count
  end

  def task3_questions
  end
end
