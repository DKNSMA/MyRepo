#!/bin/bash
tar -czvf /backup/monitoring_$(date +%F).tar.gz /srv/docker/monitoring
