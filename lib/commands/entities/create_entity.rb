module Commands
  module Entities
    class CreateEntity < Base
      attr_accessor :uid, :name, :description, :state, :extra_data

      validates :uid, presence: true, allow_blank: false
      validates :name, presence: true, allow_blank: false

      def aggregate_uid
        uid
      end
    end
  end
end