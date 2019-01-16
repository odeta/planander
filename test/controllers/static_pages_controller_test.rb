require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
  end

  test 'should get home' do
    log_in_as(@user)
    get month_path
    assert_response :success
    assert_select 'title', 'Planander'
  end
end
