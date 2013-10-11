require 'json'

module BestDishes
  module Tasks
    class BrazilPopulator

      def self.states
        ActiveSupport::JSON.decode(Rails.root.join('lib', 'tasks', 'json', 'states.json'))
      end

      def self.populate
        states.each do |state|
          s = State.create(acronym: state['acronym'], name: state['name'])

          state['cities'].each do |city|
            s.cities.create(name: city)
          end
        end
      end
    end
  end
end