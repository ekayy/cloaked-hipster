module ApplicationHelper

	def show_user_bg
    "background:transparent url(#{@user.profile.image.url}) no-repeat fixed center center;
    -webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;"
  end
end
