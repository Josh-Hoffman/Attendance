#!/bin/bash

#    _________________________________________________________________________________________________
#   |* ___________________________________________GPL-3_Licence_____________________________________ *|
#   | /                                                                                             \ |
#   | |         This program is free software: you can redistribute it and/or modify                | |
#   | |         it under the terms of the GNU General Public License as published by                | |
#   | |         the Free Software Foundation, either version 3 of the License, or                   | |
#   | |         (at your option) any later version.                                                 | |
#   | |                                                                                             | |
#   | |         This program is distributed in the hope that it will be useful,                     | |
#   | |         but WITHOUT ANY WARRANTY; without even the implied warranty of                      | |
#   | |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                       | |
#   | |         GNU General Public License for more details.                                        | |
#   | |                                                                                             | |
#   | |         You should have received a copy of the GNU General Public License                   | |
#   | |         along with this program.  If not, see <http://www.gnu.org/licenses/>.               | |
#   | |                                                                                             | |
#   | \_____________________________________________________________________________________________/ |
#   |* ________________________________________Attenance_4/25/2020__________________________________ *|
#   | /                                                                                             \ |
#   | |                                    Written by: Joshua Hoffman                               | |
#   | |                                 joshua.hoffman.ray@protonmail.com                           | |
#   | |                                                                                             | |
#   | \________________________________________Modulation_Project___________________________________/ |
#   |_________________________________________________________________________________________________|


Attenance () {

declare -A List

Roll[0]=Ferris   Call[0]=Test
Roll[1]=Path     Call[1]="$(dirname "$(realpath $0)")"
Roll[2]=Version  Call[2]="$(uname -n)"
Roll[3]=User     Call[3]="${USER:=whoami}"
Roll[4]=Date     Call[4]="$(date +'%m_%d_%y')"
Roll[5]=Time     Call[5]="$(date +'%H-%M-%S')"
Roll[6]=Uptime   Call[6]="$(awk -v OFMT=%.2f '{print $2/3600}' /proc/uptime)"
Roll[7]=Random   Call[7]="$(cat /proc/sys/kernel/random/uuid)"

	for Name in ${!Call[@]}; do
	eval export Says="\${$Name}"
	eval export ${Roll[$Name]}=\${Says:=${Call[$Name]}}
	eval List[${Roll[$Name]}]=\$${Roll[$Name]}
	done

	if [[ ${Attenance_1:=0} = 0 ]]; then

		for Here in ${!List[@]}; do
		echo -e "Position: $((A++))\nAssigned: ${Here}\nVariable: ${List[$Here]}\n"
		done

	fi

}

Attenance $@
