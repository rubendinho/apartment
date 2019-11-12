require 'apartment/resolvers/abstract'

module Apartment
  module Resolvers
    class Database < Abstract
      def resolve(tenant)
        return init_config if tenant.blank?

        tenant_config = Apartment.tenant_db_config[tenant]

        init_config.dup.merge(
          tenant_config.slice(:database, :username, :password, :port, :host)
        )
      end
    end
  end
end
