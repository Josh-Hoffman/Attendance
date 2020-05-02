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
#   |* ________________________________________Attenance_5/2/2020___________________________________ *|
#   | /                                                                                             \ |
#   | |                                    Written by: Joshua Hoffman                               | |
#   | |                                 joshua.hoffman.ray@protonmail.com                           | |
#   | |                                                                                             | |
#   | \________________________________________Modulation_Project___________________________________/ |
#   |_________________________________________________________________________________________________|


Attenance () {

Call[0]=Name    Roll[0]="$0"
Call[1]=Path    Roll[1]="$(dirname "$(realpath $0)")"                        
Call[2]=Version Roll[2]="$(uname -n)"                                         
Call[3]=User    Roll[3]="${USER:=whoami}"                                    
Call[4]=Date    Roll[4]="$(date +'%m_%d_%y')"                                
Call[5]=Time    Roll[5]="$(date +'%H-%M-%S')"                                
Call[6]=Uptime  Roll[6]="$(awk -v OFMT=%.2f '{print $2/3600}' /proc/uptime)" 
Call[7]=Uuid    Roll[7]="$(cat /proc/sys/kernel/random/uuid)"
Call[8]=Euid    Roll[8]="$(echo $EUID)"
Call[9]=Cores   Roll[9]="$(awk 'NR==11 {print $3}' /proc/cpuinfo)"

eval Seat[$((A++))]=\${0..9}
eval declare -Ag List[\${Call[{0..9}]}]=\${Roll[$((B++))]}
eval declare -Ag Name[\${Call[{0..9}]}]=\${Seat[$((C++))]:=\${Roll[$((C-1))]}}

}

Attenance $@
