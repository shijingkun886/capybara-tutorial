require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    sleep(1)
    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(0)
        page.perform :click_new
        page.perform :submit_post, 'my first post', 'I wanna be the full-stack dev'
        expect(page.succ_return.text).to eq('Title: my first post')
        expect(page.notice_message).to eq('Post was successfully created.')
        page.perform :go_back
        expect(page.new_post_in_list.text).to eq('my first post')
    end
  end

  scenario 'show top 10 list' do
    visit 'posts'
    on_page_with :top_10_posts do |page|
      page.perform :click_new
      page.perform :submit_post, 'my first post', 'I wanna be the full-stack dev'
      page.perform :go_back
      expect(page.loading_tips).to have_content('initialize')
      expect(page.loading_tips).to have_content('start')
      expect(page.top_10_list).to have_content('my first post')
    end
  end

  scenario 'edit a post' do
    visit 'posts'
    on_page_with :edit_post do |page|
      page.perform :click_new
      page.perform :submit_post, 'my first post', 'I wanna be the full-stack dev'
      page.perform :go_back
      page.perform :click_edit
      page.perform :submit_edit, 'my first post edited', 'I wanna be the full-stack dev'
      expect(page.succ_return.text).to eq('Title: my first post edited')
      expect(page.notice_message).to eq('Post was successfully updated.')
    end
  end
end
