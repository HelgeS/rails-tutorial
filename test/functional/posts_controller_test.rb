require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  def encode_credentials(username, password)
    "Basic #{Base64.encode64("#{username}:#{password}")}"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    @request.env['HTTP_AUTHORIZATION'] = encode_credentials('helge', 'test')
    get :new
    assert_response :success
  end

  test "should create post" do
    @request.env['HTTP_AUTHORIZATION'] = encode_credentials('helge', 'test')
    assert_difference('Post.count') do
      post :create, post: { content: @post.content, name: @post.name, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    @request.env['HTTP_AUTHORIZATION'] = encode_credentials('helge', 'test')
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    @request.env['HTTP_AUTHORIZATION'] = encode_credentials('helge', 'test')
    put :update, id: @post, post: { content: @post.content, name: @post.name, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    @request.env['HTTP_AUTHORIZATION'] = encode_credentials('helge', 'test')
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
