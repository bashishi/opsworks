app = search("aws_opsworks_app").first
Chef::Log.info("********** The app's short name is '#{app['shortname']}' **********")
Chef::Log.info("********** The app's URL is '#{app['app_source']['url']}' **********")

search("aws_opsworks_app").each do |app|
  Chef::Log.info("********** The app's short name is '#{app['shortname']}' **********")
  Chef::Log.info("********** The app's URL is '#{app['app_source']['url']}' **********")
end

git "/home/ec2-user/sampleApps" do
  repository "#{app['app_source']['url']}"
  action :sync
end

execute "commend" do
  cwd "cp /home/ec2-user/sampleApps/* /var/www/html/"
end