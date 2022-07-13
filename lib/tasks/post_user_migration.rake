desc "Assign all posts to first users"

task post_user_migration: :environment do 
    Post.update_all(user_id: User.first.id)
end