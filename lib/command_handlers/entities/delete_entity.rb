module CommandHandlers
  module Entities
    class DeleteEntity
      def call(command)
        stream_name = "Domain::Entity$#{command.aggregate_uid}"

        repository = AggregateRoot::Repository.new

        repository.with_aggregate(Domain::Entity.new(command.aggregate_uid), stream_name) do |entity|
          entity.delete(command.aggregate_uid)
          repository.store(entity, stream_name)
        end
      end
    end
  end
end
