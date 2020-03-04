module CommandHandlers
  module Entities
    class EditEntity
      def call(command)
        stream_name = "Domain::Entity$#{command.aggregate_uid}"

        entity_data = {
          uid: command.uid,
          name: command.name,
          description: command.description,
          state: command.state,
          extra_data: command.extra_data
        }.reject { |_, v| v.nil? }

        repository = AggregateRoot::Repository.new

        repository.with_aggregate(Domain::Entity.new(command.aggregate_uid), stream_name) do |entity|
          entity.edit(entity_data)
          repository.store(entity, stream_name)
        end
      end
    end
  end
end
