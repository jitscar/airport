module Faker
  class Flight < Base
    class << self
      def number
        [*('A'..'Z')].sample(2).join + Faker::Number.number(4)
      end
    end
  end
end
