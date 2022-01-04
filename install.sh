#!/bin/bash
# Simple and automate installer for CentOS/Fedora
# Created by Yevgeniy Goncharov, https://sys-adm.in

installAutomate() {
	
	if rpm -qa | grep dnf-automatic &> /dev/null
	then
		echo "DNF Automeic alredy installed. Exit."
		exit 1
	else
		dnf install dnf-automatic -y
		sed -i 's/random_sleep.*/random_sleep = 300/' /etc/dnf/automatic.conf
		sed -i 's/apply_updates.*/apply_updates = yes/' /etc/dnf/automatic.conf
		systemctl enable --now dnf-automatic.timer
		systemctl enable --now dnf-automatic-download.timer
		echo "DNF Automate is installed now!"
		exit 1
	fi
	
}

installAutomate
