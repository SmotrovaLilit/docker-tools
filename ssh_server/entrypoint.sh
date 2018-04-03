#!/bin/bash

##изменение настроек к бд
if [ -z "$OWNER_PASSWORD" ]; then
    echo "Error: don't set ENV OWNER_PASSWORD." >&2
    exit 1
fi

echo "owner:$OWNER_PASSWORD" | chpasswd

/usr/sbin/sshd -D && apache2-foreground