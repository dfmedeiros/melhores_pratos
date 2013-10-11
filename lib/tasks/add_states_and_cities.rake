desc 'Add States and Cities'

namespace :locations do
  task add_states_and_cities: :environment do
    BestDishes::Tasks::BrazilPopulator.populate
  end
end