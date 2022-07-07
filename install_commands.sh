function install_basic() {
 	sudo apt install -y git cmake vim

 }
 
 function install_vscode() {
	sudo apt install software-properties-common apt-transport-https wget -y
	wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
	echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
	sudo apt update
	sudo apt install -y code
 }
 
 function install_chrome() {
 	sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2 ubuntu-keyring -y
 	sudo wget -O- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg
 	echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
 	sudo apt update
 	sudo apt install google-chrome-stable -y
 }
 
 
 function install_tilix() {
 	sudo apt-get -y install tilix
 	sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/tilix 1
 	sudo update-alternatives --config x-terminal-emulator;

}

function install_slack() {
	sudo snap install -y snapd
	sudo snap install core
	sudo snap install slack --classic
}

function install_ros2_foxy() {
	# https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html
	cd ~/
	sudo apt update && sudo apt install locales
	sudo locale-gen en_US en_US.UTF-8
	sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
	export LANG=en_US.UTF-8
	sudo apt update && sudo apt install curl gnupg2 lsb-release -y
	sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
	sudo apt update
	sudo apt upgrade -y
	sudo apt install -y \
	libbullet-dev \
	python3-colcon-common-extensions \
	python3-flake8 \
	python3-pip \
	python3-pytest-cov \
	python3-rosdep \
	python3-setuptools \
	python3-vcstool \
	wget
	# install some pip packages needed for testing
	python3 -m pip install -U \
	argcomplete \
	flake8-blind-except \
	flake8-builtins \
	flake8-class-newline \
	flake8-comprehensions \
	flake8-deprecated \
	flake8-docstrings \
	flake8-import-order \
	flake8-quotes \
	pytest-repeat \
	pytest-rerunfailures \
	pytest
	# install Fast-RTPS dependencies
	sudo apt install --no-install-recommends -y \
	libasio-dev \
	libtinyxml2-dev
	# install Cyclone DDS dependencies
	sudo apt install --no-install-recommends -y \
	libcunit1-dev

	sudo apt install ros-foxy-desktop -y

	source /opt/ros/foxy/setup.bash
	mkdir -p ~/robot_ws/src
	cd ~/robot_ws
	colcon build

	sudo rosdep init
	rosdep update
	rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-5.3.1 urdfdom_headers"
	
	echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
	echo "source ~/robot_ws/install/local_setup.bash" >> ~/.bashrc

	echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
	echo "export _colcon_cd_root=/opt/ros/foxy/" >> ~/.bashrc
	echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
	echo "source ~/robot_ws/install/setup.bash"  >> ~/.bashrc
	echo "alias cs='cd ~/robot_ws/src'"  >> ~/.bashrc
	echo "alias cw='cd ~/robot_ws'"  >> ~/.bashrc
	echo "alias sb='source ~/.bashrc'"  >> ~/.bashrc
	echo "alias cb='cw && colcon build && sb'"  >> ~/.bashrc
	echo "alias eb='gedit ~/.bashrc'"  >> ~/.bashrc
	export ROS_LOCALHOST_ONLY=0
	source ~/.bashrc
 }

 function set_git_config() {
	cd ~
	git config --global user.email hoony3355@gmail.com
	git config --global user.name cooniecoon
	echo "alias token_save='git config credential.helper store'" >> ~/.bashrc
	source ~/.bashrc
 }
