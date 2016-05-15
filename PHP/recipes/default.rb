%w[php-devel php-mbstring gd-devel php-gd php-mysql].each do |pkg|
	yum_package pkg do
	  action :install
	end
end
