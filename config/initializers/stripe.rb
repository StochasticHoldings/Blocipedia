# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: 'pk_test_njmLZmKdKq9FoccC6NigsGJM',
  secret_key: 'sk_test_K3idjtjnnnEibKbr70XTeDbw'
}

# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
