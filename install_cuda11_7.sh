# ubuntu 22.04 cuda 11.7
# https://developer.nvidia.com/cuda-11-7-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local

cd ~/
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda-repo-ubuntu2204-11-7-local_11.7.0-515.43.04-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu2204-11-7-local_11.7.0-515.43.04-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

echo "export PATH=$PATH:/usr/local/cuda-11.7/bin" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.7/lib64" >> ~/.bashrc
echo "export CUDADIR=/usr/local/cuda-11.7" >> ~/.bashrc

# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_adv_train.so.8.0.5 /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_adv_train.so.8
# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_ops_infer.so.8.0.5  /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_ops_infer.so.8
# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_cnn_train.so.8.0.5  /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_cnn_train.so.8
# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_adv_infer.so.8.0.5  /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_adv_infer.so.8
# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_ops_train.so.8.0.5  /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_ops_train.so.8
# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_cnn_infer.so.8.0.5 /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn_cnn_infer.so.8
# sudo ln -sf /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn.so.8.0.5  /usr/local/cuda-11.7/targets/x86_64-linux/lib/libcudnn.so.8
