require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
    def setup
        @user = users(:tunji)
        @micropost = @user.microposts.build(content: 'Loren Ipsum')
    end

    test 'should be valid' do
        assert @micropost.valid?
    end

    test 'user ID should be present' do
        @micropost.user_id = nil
        assert_not @micropost.valid?
    end

    test 'contet should be present' do
        @micropost.content = ' '
        assert_not @micropost.valid?
    end

    test 'content should be at most 140 characters' do
        @micropost.content = 'a' * 141
        assert_not @micropost.valid?
    end
    test 'order should be the most recent first' do
        assert_equal Micropost.first, microposts(:most_recent)
    end
end
