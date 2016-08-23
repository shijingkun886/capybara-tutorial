module PageWithTop10Posts
	include Gizmo::PageMixin

	def valid?
		has_css?('.right .top-10-container')
	end

	def loading_tips
		find('.right .tips')
	end

  def top_10_list
		find('.right .top-10-list')
	end

	def new_post_link
		find('.parent .left a[href="/posts/new"]')
	end

	def create_post_button
		find('.actions input[value="Create Post"]')
	end

	def back_link
		find('a[href="/posts"]')
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

end