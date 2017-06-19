namespace :add_fake_data do
  desc 'add fake data for airport'

  task planes: :environment do
    FactoryGirl.create_list(:plane, 15)
  end
end
