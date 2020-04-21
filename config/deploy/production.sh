source 'config/deploy/lib/deploy.sh'

RAILS_ENV='production'

# Deploy server app
deploy \
  --name 'spreeproject_server_app' \
  --aws-access-key "$AWS_ACCESS_KEY_ID" \
  --aws-secret-key "$AWS_SECRET_ACCESS_KEY" \
  --region 'us-east-1' \
  --repo "$YOUR_ECR_ID.dkr.ecr.us-east-1.amazonaws.com/spreeproject/server_app" \
  --cluster 'spreeproject-production' \
  --service 'spreeproject'
  --task 'spreeproject-production'

# Deploy worker app
deploy \
  --name 'spreeproject_worker_app' \
  --aws-access-key "$AWS_ACCESS_KEY_ID" \
  --aws-secret-key "$AWS_SECRET_ACCESS_KEY" \
  --region 'us-east-1' \
  --repo "$YOUR_ECR_ID.dkr.ecr.us-east-1.amazonaws.com/spreeproject/server_app" \
  --cluster 'spreeproject-production' \
  --service 'spreeproject-worker'
  --task 'spreeproject-production-worker'
  --skip-build true