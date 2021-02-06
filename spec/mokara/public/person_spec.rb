# frozen_string_literal: true

require 'spec_helper'
require 'support/vcr'

RSpec.describe Mokara::Public::Person, :vcr do
  subject(:person) { described_class.new(id) }

  context 'with a valid orcid' do
    let(:id) { '0000-0001-8485-6532' }

    it 'returns the data' do
      expect(person.given_names).to eq('Adam')
      expect(person.family_name).to eq('Wead')
      expect(person.credit_name).to eq('Dr. Adam Wead')
      expect(person.visibility).to eq('PUBLIC')
      expect(person.emails).to be_an(Mokara::Public::Email)
    end
  end

  context 'with an invalid orcid' do
    let(:id) { '12341234' }

    it 'raises an error' do
      expect { person.family_name }.to raise_error(Mokara::NotFound, 'The resource was not found.')
    end
  end
end
