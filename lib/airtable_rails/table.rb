module AirtableRails
  class Table
    def initialize(table_name, force_write: false)
      @force_write = force_write
      @client = Airtable::Client.new(ENV.fetch("AIRTABLE_API_KEY"))
      @table = @client.table(ENV.fetch("AIRTABLE_APP_ID"), table_name)
    end

    # Read methods
    delegate :records, :all, :select, :find,
             to: :table

    # Write methods
    %w(create update destroy).each do |method_name|
      define_method method_name do |*args|
        if Rails.env.production? || force_write
          table.public_send(method_name, *args)
        else
          Rails.logger.info("AIRTABLE: #{table.worksheet_name}.#{method_name}(#{args.map(&:inspect).join(", ")})")
        end
      end
    end

    def create_from_hash(attrs)
      record = Airtable::Record.new(attrs)
      create(record)
    end

    private

    attr_reader :client, :table, :force_write
  end
end
