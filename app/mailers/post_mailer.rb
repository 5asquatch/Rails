class PostMailer < ApplicationMailer
    default from: "blog@example.com"

    def new_post_email
        @post = params[:post]
        mail(to: "sasquatch@example.com", subject: 'New post')
    end

    def edit_post_email
        @post = params[:post]
        mail(to: "sasquatch@example.com", subject: 'Post Updated')
    end
end