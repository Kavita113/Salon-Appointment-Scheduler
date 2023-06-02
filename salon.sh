#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon -t --no-align -c"
echo -e "\n~~~~ MY SALON ~~~~"

MAIN_MENU(){
  if [[ $1 ]]
  then 
      echo "$1"
  fi 
  echo -e "\nWelcome to my salon, how can i help you?"
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED 
  case $SERVICE_ID_SELECTED in
  1) CUT ;;
  2) COLOR ;;
  3) PERM ;;
  4) STYLE ;;
  5) TRIM ;;
  *) MAIN_MENU "I coultn't find that service. What would you like today?" ;;
  esac 
}
CUT(){
  
  #get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #checks customer 
  if [[ -z $CUSTOMER_NAME ]]
  then
      echo "I don't have a record for that phone number, what's your name?"
      #insert new customer
      read CUSTOMER_NAME 
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
  fi 
  #get customer_id 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' AND name = '$CUSTOMER_NAME'")

  #get timing of service from customer
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

  #get service id
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = 'cut'")
  #get appointment id
  APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID,'$SERVICE_TIME',$CUSTOMER_ID)") 
}

COLOR(){
  #get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #checks customer 
  if [[ -z $CUSTOMER_NAME ]]
  then
      echo "I don't have a record for that phone number, what's your name?"
      #insert new customer
      read CUSTOMER_NAME 
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
  fi 
  #get customer_id 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' AND name = '$CUSTOMER_NAME'")

  #get timing of service from customer
  echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."

  #get service id
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = 'color'")
  #get appointment id
  APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID,'$SERVICE_TIME',$CUSTOMER_ID)")

}
PERM(){
  #get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #checks customer 
  if [[ -z $CUSTOMER_NAME ]]
  then
      echo "I don't have a record for that phone number, what's your name?"
      #insert new customer
      read CUSTOMER_NAME 
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
  fi 
  #get customer_id 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' AND name = '$CUSTOMER_NAME'")

  #get timing of service from customer
  echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."

  #get service id
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = 'perm'")
  #get appointment id
  APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID,'$SERVICE_TIME',$CUSTOMER_ID)")
}
STYLE(){
  #get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #checks customer 
  if [[ -z $CUSTOMER_NAME ]]
  then
      echo "I don't have a record for that phone number, what's your name?"
      #insert new customer
      read CUSTOMER_NAME 
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
  fi 
  #get customer_id 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' AND name = '$CUSTOMER_NAME'")

  #get timing of service from customer
  echo -e "\nWhat time would you like your style, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."

  #get service id
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = 'style'")
  #get appointment id
  APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID,'$SERVICE_TIME',$CUSTOMER_ID)")

}
TRIM(){
  #get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #checks customer 
  if [[ -z $CUSTOMER_NAME ]]
  then
      echo "I don't have a record for that phone number, what's your name?"
      #insert new customer
      read CUSTOMER_NAME 
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
  fi 
  #get customer_id 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' AND name = '$CUSTOMER_NAME'")

  #get timing of service from customer
  echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."

  #get service id
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name = 'trim'")
  #get appointment id
  APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID,'$SERVICE_TIME',$CUSTOMER_ID)")
}
MAIN_MENU
