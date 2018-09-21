require_relative './spec_helper.rb'

describe 'Tranzila::Token' do
  describe 'positive flow' do
    before do
      @tranzila_token = Tranzila::Token.new(ccno: '4111111111111111')
      allow(@tranzila_token).to receive(:request).and_return(token_good_response)
    end

    describe '#call' do
      it 'returns correct token' do
        result = 'W18c88122e42afe2312'
        expect do
          responce = @tranzila_token.call
          expect(responce).to eq(result)
        end.to_not raise_error
      end
    end
  end

  describe 'negative flow' do
    before do
      @tranzila_token = Tranzila::Token.new(ccno: '4111111111111111')
      allow(@tranzila_token).to receive(:request).and_return(token_bad_response)
    end

    describe '#call' do
      it 'returns correct token' do
        expect do
          @tranzila_token.call
        end.to raise_error('Something went wrong')
      end
    end
  end
end
