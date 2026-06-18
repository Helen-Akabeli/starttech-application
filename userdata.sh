#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/null) 2>&1
echo "================ Starting Offline SSM Agent Installation ================"
cd /tmp
# Download the standalone Debian/Ubuntu installation package directly from AWS S3
wget https://amazonaws.com
# Install the package locally without needing apt repositories
sudo dpkg -i amazon-ssm-agent.deb
# Start and enable the service
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
echo "================ Offline SSM Agent Installation Complete ================"
