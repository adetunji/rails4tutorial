module StaticPagesHelper
    # Logs in the given user.
    def login(user)
        session[:user_id] = user.id
    end
end
