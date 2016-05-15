# apacheのインストール
package "httpd" do
  action :install
end

# apacheのservice設定
service "httpd" do
  supports :status => true, :restart => true
  action [ :enable, :restart ]
end
