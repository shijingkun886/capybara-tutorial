module PageWithEditPost
  include Gizmo::PageMixin

  def valid?
    has_css?('.parent')
  end


  def new_post_link
    find('.parent .left a[href="/posts/new"]')
  end

  def create_post_button
    find('.actions input[value="Create Post"]')
  end

  def edit_post_button
    find_link('Edit')
  end

  def submit_post_button
    find('.actions input[value="Update Post"]')
  end

  def back_link
    find('a[href="/posts"]')
  end

  def succ_return
    find('body').all('p')[1]
  end
  
  def notice_message
    find('#notice').text
  end

  define_action :submit_post do |title, content|
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
    create_post_button.click
  end

  define_action :go_back do
    back_link.click
  end

  define_action :click_new do
    new_post_link.click
  end

  define_action :click_edit do
    edit_post_button.click
  end

  define_action :submit_edit do |title, content|
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
    submit_post_button.click
  end

end