#!/bin/sh

# Create the .bashrc.d directory if it does not exist and add it to .bashrc
mkdir -p ~/.bashrc.d
chmod 700 ~/.bashrc.d

# Install Assistants CLI
curl -L "https://github.com/PrashamTrivedi/assistants-cli/releases/latest/download/assistants-cli_Linux_x86_64.tar.gz" -o "assistants-cli.tar.gz"
mkdir -p ~/assistant-cli
tar -xvf assistants-cli.tar.gz -C ~/assistant-cli
chmod +x ~/assistant-cli/assistants-cli
sudo ln -s ~/assistant-cli/assistants-cli /usr/bin/assistant-cli

if ! grep -q "for file in ~/.bashrc.d/*" ~/.bashrc; then
    echo 'for file in ~/.bashrc.d/*; do' >> ~/.bashrc
    echo '    source "$file"' >> ~/.bashrc
    echo 'done' >> ~/.bashrc
fi

# Install and verify AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
aws --version

# Install AWS SAM CLI
curl -L "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "awssamcli.zip"
unzip awssamcli.zip -d sam-installation
sudo ./sam-installation/install
sam --version

# Copy aws to Bashrc
chmod +x awsConfig
cp awsConfig ~/.bashrc.d/awsConfig

# Copy git-alias to Bashrc
chmod +x git-alias
cp git-alias ~/.bashrc.d/git-alias
