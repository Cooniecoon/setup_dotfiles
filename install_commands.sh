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

 
 install_slack
