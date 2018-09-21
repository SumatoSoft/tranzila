require_relative './spec_helper.rb'

describe 'Tranzila::Refund' do
  describe 'positive flow' do
    before do
      @refund = Tranzila::Refund.new(authnr: '0000000', sum: 15, tranmode: 'C56', TranzilaTK: 'W18c88122e42afe2312')
      allow(@refund).to receive(:request).and_return(refund_good_response)
    end

    describe '#call' do
      it 'returns correct' do
        result = {
          "Response"=>"000",
          "TranzilaTK"=>"W18c88122e42afe2312",
          "DclickTK"=>"",
          "authnr"=>"0000000",
          "supplier"=>"test",
          "tranmode"=>"C75",
          "sum"=>"15",
          "ConfirmationCode"=>"0000000",
          "index"=>"76",
          "Responsesource"=>"0",
          "Responsecvv"=>"0",
          "Responseid"=>"0",
          "Tempref"=>"04900001",
          "DBFIsForeign"=>"0",
          "DBFcard"=>"5",
          "cardtype"=>"5",
          "DBFcardtype"=>"1",
          "cardissuer"=>"1",
          "DBFsolek"=>"1",
          "cardaquirer"=>"1",
          "tz_parent"=>"test"
        }
        expect do
          responce = @refund.call
          expect(responce).to eq(result)
        end.to_not raise_error
      end
    end
  end

  describe 'negative flow' do
    before do
      @refund = Tranzila::Refund.new(authnr: '0000000', sum: 15, tranmode: 'C56', TranzilaTK: 'W18c88122e42afe2312')
      allow(@refund).to receive(:request).and_return(refund_bad_response)
    end

    describe '#call' do
      it 'returns correct' do
        expect do
          @refund.call
        end.to raise_error('Something went wrong')
      end
    end
  end
end
