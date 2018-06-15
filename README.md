# AirtableRails

AirtableRails is an easy and safe way to access Airtable.
It handles client creation and app selection.
Write methods are restricted to production and will write to log in other environments.

## Usage

    ENV["AIRTABLE_API_KEY"] = "key1234567890"
    ENV["AIRTABLE_APP_ID"] = "app1234567890"

    table = AirtableRails::Table.new("Table name")

`table` acts like an `Airtable::Table` as described here: https://github.com/Airtable/airtable-ruby.

## create_from_hash

Instead of creating records in two steps:

    record = Airtable::Record.new(:name => "Sarah Jaine", :email => "sarah@jaine.com")
    table.create(record)

you can use `create_from_hash` to do both in a single call:

    table.create_from_hash(:name => "Sarah Jaine", :email => "sarah@jaine.com")
