require 'spec_helper'

RSpec.describe 'app' do
  describe 'GET /' do
    it "should return successfully on GET" do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe 'POST /api/gratitude' do
    it "should return successfully on GET" do
      expect(stub_client)
        .to receive(:put_item)
        .with({
          condition_expression: be_kind_of(String),
          expression_attribute_names: be_kind_of(Hash),
          item: {
             "id"=>be_kind_of(String),
             "count" => 0,
             "created_at" =>be_within(3).of(Time.now.to_i)
          },
          :table_name=>"Gratitude"})
        .and_call_original

      post '/api/gratitude'

      expect(last_response).to be_ok
      expect(json_result).to match({
        "id" => be_kind_of(String),
        "created_at" => be_kind_of(String),
        "count" => 0
      })
    end
  end
end
