module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :users, [Types::UserType], null: false,
      description: "Return a list of users"
    def users
      User.all
    end

    field :me, Types::UserType, null:false,
      description: "Return the first user"
    def me
      @context[:current_user]
    end

    field :projects, [Types::ProjectType], null:false,
      description:"The projects for the current user"
    def projects
      @context[:current_user].projects
    end

    field :hello, String, null:false,
      description: "Returns Hello World"
    def hello
      "Hello World"
    end
  end
end
