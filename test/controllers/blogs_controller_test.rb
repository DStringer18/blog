require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create blog" do
    assert_difference("Blog.count") do
      post articles_url, params: { blog: {  } }
    end

    assert_redirected_to article_url(Blog.last)
  end

  test "should show blog" do
    get article_url(@blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch article_url(@blog), params: { blog: {  } }
    assert_redirected_to article_url(@blog)
  end

  test "should destroy blog" do
    assert_difference("Blog.count", -1) do
      delete article_url(@blog)
    end

    assert_redirected_to articles_url
  end
end
