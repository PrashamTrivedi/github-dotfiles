#!/bin/sh

# Create the .bashrc.d directory if it does not exist and add it to .bashrc
mkdir -p ~/.bashrc.d
chmod 700 ~/.bashrc.d
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
curl "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "awssamcli.zip"
unzip awssamcli.zip -d sam-installation
sudo ./sam-installation/install
sam --version

# Copy aws to Bashrc
chmod +x awsConfig
cp awsConfig ~/.bashrc.d/awsConfig

# Copy git-alias to Bashrc
chmod +x git-alias
cp git-alias ~/.bashrc.d/git-alias
