# Include commands that you would like to execute after the container is created
uname -a

# install rust
curl -L -o /tmp/fastly.tar.gz https://github.com/fastly/cli/releases/download/v10.15.0/fastly_v10.15.0_linux-amd64.tar.gz
tar -xvzf /tmp/fastly.tar.gz -C /tmp
mv /tmp/fastly /usr/local/bin/
chmod +x /usr/local/bin/fastly
