#!/bin/bash
SERVICENAME=$(basename $(pwd))

echo "Creating systemd service... /etc/systemd/system/${SERVICENAME}.service"
# Create systemd service file
cat >/etc/systemd/system/$SERVICENAME.service <<EOF
[Unit]
Description=$SERVICENAME
Requires=podman.service
After=podman.service

[Service]
Restart=always
WorkingDirectory=$(pwd)
# Shutdown container (if running) when unit is started
ExecStartPre=$(which podman-compose) -f docker-compose.yml down
# Start container when unit is started
ExecStart=$(which podman-compose) -f docker-compose.yml up
# Stop container when unit is stopped
ExecStop=$(which podman-compose) -f docker-compose.yml down

[Install]
WantedBy=multi-user.target
EOF

echo "Enabling & starting $SERVICENAME"
# Autostart systemd service
systemctl enable $SERVICENAME.service
# Start systemd service now
systemctl start $SERVICENAME.service
