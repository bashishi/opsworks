# apache�̃C���X�g�[��
package "httpd" do
  action :install
end

# apache��service�ݒ�
service "httpd" do
  supports :status => true, :restart => true
  action [ :enable, :restart ]
end
