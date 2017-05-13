#!/bin/bash

##  GUNBOT 3.2 CUSTOM LAUNCHER
##  version v0.0.1 / May 2017.
##
##
##  Denis Smirnov / densmirnov@me.com / densmirnov.com
##
##  BTC: 1denG4FjcXDeGSYeiv65R6Eyi3HWo7R8j
##  ETH: 0xa4C7fACEFC08e684Cd9043c3e31C86Dfb88DF75a
##  LSK: 10061645427951005252L
##  -----------------------------------------------

##  STARTUP ITEMS
##  -----------------------------------------------
export BOLD && export RED && export GREEN && export BLUE && export YELLOW && export WHITE && export RESET && export CMD && export BOTFOLDER
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
YELLOW=$(tput setaf 3)
WHITE=$(tput setaf 7)
RESET=$(tput sgr0)

export CMD && export BOTFOLDER && export FILES && export NAME
CMD=$1
BOTFOLDER="${PWD}"
FILES="*-config.js"

echo -e "\n${GREEN}${BOLD}╔═ GUNBOT LAUNCHER v0.0.1${RESET}${BLUE} $(date +%d.%m.%Y\ %H:%M)${RESET} ${GREEN}════════════════════╗${RESET}"
echo -e "${GREEN}""╠══════════════════════════════════════════════════════════════╣\n""${RESET}"

##  OPTIONS
##  -----------------------------------------------
if [[ -n "$CMD" ]]; then

  ##  START
  ##  -----------------------------------------------
  if [[ "$CMD" == "start" ]]; then
    for f in $FILES
    do
      NAME="${f%-*}"
      echo -e "${WHITE}""• Checking if ${YELLOW}$NAME ${WHITE}is running...\t${RESET}\c"
      if ! screen -list | grep -qw "$NAME"; then
        echo -e "${RED}${BOLD}- NO!${RESET}\c"
        echo -n "${BLUE} [ starting ${RESET}"
        # screen -dmS $NAME
        screen -dmS "$NAME" "${BOTFOLDER}"/gunbot "$NAME" poloniex && sleep 1
        echo -n "${BLUE}...1 ${RESET}" && sleep 1
        echo -n "${BLUE}...2 ${RESET}" && sleep 1
        echo -n "${BLUE}...3 ${RESET}" && sleep 1
        echo -n "${BLUE}...4 ${RESET}" && sleep 1
        echo -e "${BLUE}...5! ]  ${RESET}${GREEN}${BOLD}+ Done!${RESET}\n"
      else
        echo -e "\t${GREEN}${BOLD}+ YES! ${RESET}\c"
        echo -n "${BLUE} [ skipping... ]${RESET}"
        echo -e " " && sleep 0.2
      fi
    done
    echo -e " "
    echo -e "${GREEN}""  ============================\n""${RESET}"
    echo -e "${GREEN}""${BOLD}""Done! All Pairs are running!\n""${RESET}"
    exit 0
  fi

  ##  STOP
  ##  -----------------------------------------------
  if [[ "$CMD" == "stop" ]]; then
    for f in $FILES
    do
      NAME="${f%-*}"
      echo -e "${WHITE}• Checking if ${YELLOW}$NAME ${WHITE}is running...\t${RESET}\c"
      if ! screen -list | grep -q "$NAME"; then
        echo -e "${GREEN}${BOLD}【 NO! 】\t${RESET}\c"
        echo -n "${BLUE} [ skipping... ]${RESET}"
        echo -e " "
      else
        echo -e "${RED}${BOLD}【 YES! 】${RESET}\c"
        echo -n "${BLUE}[ exiting... ]${RESET}"
        echo -e " "
        screen -S "$NAME" -X quit && sleep 0.2
      fi
    done
    echo -e " "
    echo -e "${GREEN}""============================""${RESET}"
    echo -e "${GREEN}${BOLD}Done! All Pairs are stopped! ${RESET}\n"
    exit 0
  fi



  ##  LIST
  ##  -----------------------------------------------
  if [[ "$CMD" == "list" ]]; then
    export LOOKUP && export HEADER && export DIVIDER
    LOOKUP="ps aux"
    HEADER="%-12b\t%-12s\t%-12b\n"
    DIVIDER=${BLUE}"------------"${RESET}
    echo -e "${BLUE}""\n  STRATEGY" "  PAIR" "  EXCHANGE""${RESET}"
    echo -e "${DIVIDER}" "${DIVIDER}" "${DIVIDER}"
    $LOOKUP | grep -v grep | grep -v gunctl | grep "SCREEN" | awk '{printf "  %-12s\t  %-12s\t  %-12s\n",$09,$13,$16}'
    exit 0
  fi
else
  echo -e "${RED}""  ╔═ COMMAND MISSING! ════════════════════════════════╗""${RESET}"
  echo -e "${RED}""  ╠═══════════════════════════════════════════════════╣""${RESET}"
  echo -e "  ${RED}║${RESET}  ${BLUE}Usage: ${WHITE}${BOLD}bash${RESET} guncontrol.sh [${GREEN} start${RESET}, ${RED}stop${RESET}, ${YELLOW}list${RESET} ]${RESET}  ${RED}║${RESET}"
  echo -e "${RED}""  ╠═══════════════════════════════════════════════════╣""${RESET}"

  echo " "
  exit 0
fi
