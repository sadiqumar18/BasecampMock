require "application_system_test_case"

class ProjectThreadsTest < ApplicationSystemTestCase
  setup do
    @project_thread = project_threads(:one)
  end

  test "visiting the index" do
    visit project_threads_url
    assert_selector "h1", text: "Project Threads"
  end

  test "creating a Project thread" do
    visit project_threads_url
    click_on "New Project Thread"

    fill_in "Owner", with: @project_thread.owner_id
    fill_in "Project", with: @project_thread.project_id
    fill_in "Thread title", with: @project_thread.thread_title
    click_on "Create Project thread"

    assert_text "Project thread was successfully created"
    click_on "Back"
  end

  test "updating a Project thread" do
    visit project_threads_url
    click_on "Edit", match: :first

    fill_in "Owner", with: @project_thread.owner_id
    fill_in "Project", with: @project_thread.project_id
    fill_in "Thread title", with: @project_thread.thread_title
    click_on "Update Project thread"

    assert_text "Project thread was successfully updated"
    click_on "Back"
  end

  test "destroying a Project thread" do
    visit project_threads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project thread was successfully destroyed"
  end
end
