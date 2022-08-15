function ros2_setup() {
	mkdir -p ~/robot_ws/src
	cd ~/robot_ws
	echo "source /opt/ros/$1/setup.bash" >> ~/.bashrc
	echo "source ~/robot_ws/install/local_setup.bash" >> ~/.bashrc

	echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
	echo "export _colcon_cd_root=/opt/ros/$1/" >> ~/.bashrc
	echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
	echo "source ~/robot_ws/install/setup.bash"  >> ~/.bashrc
	echo "alias cs='cd ~/robot_ws/src'"  >> ~/.bashrc
	echo "alias cw='cd ~/robot_ws'"  >> ~/.bashrc
	echo "alias sb='source ~/.bashrc'"  >> ~/.bashrc
	echo "alias cb='cw && colcon build && sb'"  >> ~/.bashrc
	echo "alias eb='gedit ~/.bashrc'"  >> ~/.bashrc
	echo "export ROS_LOCALHOST_ONLY=0" >> ~/.bashrc
}

