#!/bin/sh

# Create the .bashrc.d directory if it does not exist and add it to .bashrc
mkdir -p ~/.bashrc.d
chmod 700 ~/.bashrc.d
if ! grep -q "for file in ~/.bashrc.d/*.bashrc" ~/.bashrc; then
    echo 'for file in ~/.bashrc.d/*.bashrc; do' >> ~/.bashrc
    echo '    source "$file"' >> ~/.bashrc
    echo 'done' >> ~/.bashrc
fi

# Install and verify AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
aws --version

# Copy aws to Bashrc
chmod +x awsConfig
cp awsConfig ~/.bashrc.d/awsConfig

# Copy git-alias to Bashrc
chmod +x git-alias
cp git-alias ~/.bashrc.d/git-alias
