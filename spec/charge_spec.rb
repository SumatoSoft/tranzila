require_relative './spec_helper.rb'

describe 'Tranzila::Charge' do
  describe 'positive flow' do
    before do
      @charge = Tranzila::Charge.new(
        'TranzilaTK' => 'W18c88122e42afe2312',
        'expdate' => '0917',
        'sum' => 15,
        'currency' => 1,
        'cred_type' => 1
      )
      allow(@charge).to receive(:request).and_return(charge_good_response)
    end

    describe '#call' do
      it 'returns correct token' do
        result = {
          "Response"=>"000",
          "cred_type"=>"1",
          "DclickTK"=>"",
          "supplier"=>"test",
          "TranzilaTK"=>"W18c88122e42afe2312",
          "expdate"=>"0917",
          "sum"=>"15currency=1",
          "ConfirmationCode"=>"0000000",
          "index"=>"30",
          "Responsesource"=>"0",
          "Responsecvv"=>"0",
          "Responseid"=>"0",
          "Tempref"=>"03410001",
          "DBFIsForeign"=>"0",
          "DBFcard"=>"5",
          "cardtype"=>"5",
          "DBFcardtype"=>"1",
          "cardissuer"=>"1",
          "DBFsolek"=>"0",
          "cardaquirer"=>"0",
          "tz_parent"=>"xtest"
        }
        expect do
          responce = @charge.call
          expect(responce).to eq(result)
        end.to_not raise_error
      end
    end
  end

  describe 'negative flow(bad code response)' do
    before do
      @charge = Tranzila::Charge.new(
        'TranzilaTK' => 'W18c88122e42afe2312',
        'expdate' => '0917',
        'sum' => 15,
        'currency' => 1,
        'cred_type' => 1
      )
      allow(@charge).to receive(:request).and_return(charge_code_response_response)
    end

    describe '#call' do
      it 'returns correct token' do
        result = {
          "Response"=>"000",
          "cred_type"=>"1",
          "DclickTK"=>"",
          "supplier"=>"test",
          "TranzilaTK"=>"W18c88122e42afe2312",
          "expdate"=>"0917",
          "sum"=>"15currency=1",
          "ConfirmationCode"=>"0000000",
          "index"=>"30",
          "Responsesource"=>"0",
          "Responsecvv"=>"0",
          "Responseid"=>"0",
          "Tempref"=>"03410001",
          "DBFIsForeign"=>"0",
          "DBFcard"=>"5",
          "cardtype"=>"5",
          "DBFcardtype"=>"1",
          "cardissuer"=>"1",
          "DBFsolek"=>"0",
          "cardaquirer"=>"0",
          "tz_parent"=>"xtest"
        }
        expect do
          responce = @charge.call
          expect(responce).to eq(result)
        end.to raise_error('Expired.')
      end
    end
  end

  describe 'negative flow' do
    before do
      @charge = Tranzila::Charge.new(
        'TranzilaTK' => 'W18c88122e42afe2312',
        'expdate' => '0917',
        'sum' => 15,
        'currency' => 1,
        'cred_type' => 1
      )
      allow(@charge).to receive(:request).and_return(charge_bad_response)
    end

    describe '#call' do
      it 'returns correct token' do
        expect do
          @charge.call
        end.to raise_error('Something went wrong')
      end
    end
  end
end
