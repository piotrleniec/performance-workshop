ApplicationRecord.transaction do
  Timecop.freeze(Date.new(2010)) do
    puts 'Creating landlords...'
    1000.times do
      Landlord.create!(
        name: "#{Faker::Name.prefix} #{Faker::Name.name} #{Faker::Name.suffix}"
      )
    end

    puts 'Creating residences...'
    Landlord.find_each do |landlord|
      rand(1..4).times do
        landlord.residences.create!(
          country: Faker::Address.country,
          state: Faker::Address.state,
          city: Faker::Address.city,
          address: Faker::Address.street_address,
          square_meters: rand(25...115)
        )
      end
    end

    puts 'Creating rooms...'
    Residence.find_each do |residence|
      number_of_rooms = case residence.square_meters
                        when (25...40)
                          1
                        when (40...60)
                          2
                        when (60...85)
                          3
                        when (85...115)
                          4
                        end

      remaining_square_meters = residence.square_meters
      number_of_rooms.times do |i|
        if i + 1 == number_of_rooms
          square_meters = remaining_square_meters
        else
          square_meters = remaining_square_meters / 2
          remaining_square_meters -= square_meters
        end

        room = residence.rooms.create!(
          square_meters: square_meters,
          furnished: rand < 0.75
        )

        room.prices.create!(
          amount: square_meters * rand(45..64),
          all_bills_included: rand < 0.5
        )
      end
    end

    puts 'Creating tenants...'
    Room.find_each do |room|
      next if rand < 0.05

      Tenant.create!(
        room: room,
        name: "#{Faker::Name.prefix} #{Faker::Name.name} #{Faker::Name.suffix}",
        gender: %w[m f].sample,
        age: rand(18..50),
        student: rand < 0.2
      )
    end
  end

  puts 'Simulating price fluctuations...'
  date = Date.new(2010) + 1.month
  while date < Date.new(2015)
    Room.order('RANDOM()').first((Room.count * 0.01).floor).each do |room|
      price = room.prices.order(:created_at).last

      room.prices.create!(
        amount: (rand(0.95..1.05) * price.amount).ceil,
        all_bills_included: price.all_bills_included
      )
    end

    date += 1.month
  end
end
