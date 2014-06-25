require 'test_helper'

describe CommonController do
  describe 'index' do
    context '正常' do
      it 'HTTPレスポンスのステータスコードが正常（200）' do
        get :index
        assert_response :success
      end
    end
  end
end
