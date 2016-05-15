
# ���t���P�[���ݒ�
cookbook_file "/etc/sysconfig/clock" do
  source "clock"
end

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Asia/Tokyo"
end

# �p�b�P�[�W�C���X�g�[���itree, mlocate, jq�j
package "tree" do
  action :install
end
package "mlocate" do
  action :install
end
package "jq" do
  action :install
end

# ���[�W�����������ϐ��y�уR�}���h���C���c�[���̃R���t�B�O���ɐݒ肷��B
bash "set_region" do
  code <<-EOL
    target=${HOME}/.bashrc
    if [ `grep EC2_URL ${target} | wc -l` -eq 0 ]; then
      echo "export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com" >> ${target}
    fi
    if [ `grep EC2_REGION ${target} | wc -l` -eq 0 ]; then
      echo "export EC2_REGION=ap-northeast-1" >> ${target}
    fi
    aws configure set region ap-northeast-1
  EOL
end