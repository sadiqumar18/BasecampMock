require 'test_helper'

class ProjectThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_thread = project_threads(:one)
  end

  test "should get index" do
    get project_threads_url
    assert_response :success
  end

  test "should get new" do
    get new_project_thread_url
    assert_response :success
  end

  test "should create project_thread" do
    assert_difference('ProjectThread.count') do
      post project_threads_url, params: { project_thread: { owner_id: @project_thread.owner_id, project_id: @project_thread.project_id, thread_title: @project_thread.thread_title } }
    end

    assert_redirected_to project_thread_url(ProjectThread.last)
  end

  test "should show project_thread" do
    get project_thread_url(@project_thread)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_thread_url(@project_thread)
    assert_response :success
  end

  test "should update project_thread" do
    patch project_thread_url(@project_thread), params: { project_thread: { owner_id: @project_thread.owner_id, project_id: @project_thread.project_id, thread_title: @project_thread.thread_title } }
    assert_redirected_to project_thread_url(@project_thread)
  end

  test "should destroy project_thread" do
    assert_difference('ProjectThread.count', -1) do
      delete project_thread_url(@project_thread)
    end

    assert_redirected_to project_threads_url
  end
end
