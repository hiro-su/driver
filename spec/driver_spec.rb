require 'spec_helper'

describe Driver do
  let(:client) { Dummy::Client.new('apikey', 'secret') }

  describe "Dummy Client" do
    it "return Dummy::Client instance" do
      expect(client.class).to eq Dummy::Client
      expect(client.apikey).to eq "apikey"
      expect(client.secret).to eq "secret"
    end

    it "return Dummy::Client::API instance" do
      expect(client.api.class).to eq Dummy::Client::API
      expect(client.api.create_database("test")).to eq "create_database: test"
      expect(client.api.drop_table("test")).to eq "drop_table: test"
    end

    it "return Dummy::Database instance" do
      expect(client.db.class).to eq Dummy::Database
      expect(client.db.create("test")).to eq "create_database: test"
      expect(client.db.delete("test")).to eq "drop_table: test"
    end
  end
end
