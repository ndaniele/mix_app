Rails.application.config.middleware.use OmniAuth::Builder do
   provider :github, 'bacda8570910bf94b68c', '95f3d39cd322c226759a4edea8352379f45739c3',
   scope: 'user:email'
end