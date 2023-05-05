import streamlit as st
import pymysql as sql
from streamlit import session_state
import mysql.connector
from datetime import datetime,time,timedelta
import json

st.title("Owner functions")

with open("config.json", "r") as jsonfile:
    data = json.load(jsonfile)
    print("Read successful")

db = sql.connect(host='localhost',user=data["username"],password=data["password"],database='fitness_tracker',charset='utf8mb4',cursorclass=sql.cursors.DictCursor)
cur = db.cursor()
click_count_proc1=0
output_container_proc1 = st.empty()

if "proc1" not in st.session_state:
    session_state.proc1 = False
if "proc2" not in st.session_state:
    session_state.proc2 = False
if "proc3" not in st.session_state:
    session_state.proc3 = False
if "proc4" not in st.session_state:
    session_state.proc4 = False
if "proc5" not in st.session_state:
    session_state.proc5 = False
if "proc6" not in st.session_state:
    session_state.proc6 = False
if "proc7" not in st.session_state:
    session_state.proc7 = False
if "proc8" not in st.session_state:
    session_state.proc8 = False
if "proc9" not in st.session_state:
    session_state.proc9 = False
if "proc10" not in st.session_state:
    session_state.proc10 = False
if "proc11" not in st.session_state:
    session_state.proc11 = False
if "proc12" not in st.session_state:
    session_state.proc12 = False
if "proc13" not in st.session_state:
    session_state.proc13 = False
if "proc14" not in st.session_state:
    session_state.proc14 = False



if st.button("User Details",key="1") or session_state.proc1:
    session_state.proc1=True
    user_details= st.text_input('Enter the User ID to display their details' , "1")
    
    if st.button("Submit",key="2"):
        try:
            cur.callproc('user_details', [user_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Gym Details",key="3") or session_state.proc2:
    session_state.proc2=True
    try:
        cur.callproc('gym_details', [])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Trainer Details",key="4") or session_state.proc3:
    session_state.proc3=True
    try:
        cur.callproc('trainer_details', [])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if  st.button("Payment Details",key="5") or session_state.proc4:
    session_state.proc4=True
    payment_details= st.text_input('Enter the User ID to display their payement details',"1")
    if st.button("Submit",key="6"):
        try:
            cur.callproc('payment_details', [payment_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')
           

if st.button("Trainer personal details",key="7") or session_state.proc5:
    session_state.proc5=True
    trainer_personal_details= st.text_input('Enter the Trainer ID to display their personal sessions',"1")
    if st.button("Submit",key="8"):
        try:
            cur.callproc('trainer_personal_details', [trainer_personal_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Trainer group details",key="9") or session_state.proc6:
    session_state.proc6=True
    trainer_group_details= st.text_input('Enter the Trainer ID to display their group sessions',"1")
    if st.button("Submit",key="10"):
        try:
            cur.callproc('trainer_group_details', [trainer_group_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')


if st.button("Group session details",key="11") or session_state.proc7:
    session_state.proc7=True
    group_session_details= st.slider('Slide to the Group ID to display detials', 1 , 10, 1)
    try:
        cur.callproc('group_session_details',[group_session_details])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("User trainer details",key="12") or session_state.proc8:
    session_state.proc8=True
    trainer_user_details= st.text_input('Enter the Trainer ID to display trainer and user detials',"1")
    if st.button("Submit",key="13"):
        try:
            cur.callproc('user_trainer_details', [trainer_user_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')
    
if st.button("Gym trainer details",key="14") or session_state.proc9:
    session_state.proc9=True
    gym_trainer_details= st.slider('Slide to the Gym ID to get trainer details', 1 , 5, 1) 
    try:  
        cur.callproc('gym_trainer_details',[gym_trainer_details])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Gym user details",key="15") or session_state.proc10:
    session_state.proc10=True
    gym_user_details= st.slider('Slide to the Gym ID to get user details', 1 , 5, 1)   
    try:
        cur.callproc('user_gym_details',[gym_user_details])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Add new user",key="16") or session_state.proc11:
    session_state.proc11=True
    payment_type_list=["DEBIT CARD","CREDIT CARD", "CASH"]
    new_user_name=st.text_input("Enter the username")
    new_street = st.text_input("Enter the street name")
    new_city = st.text_input("Enter the city name")
    new_zip = st.text_input("Enter the zip code")
    new_phone_no = st.text_input("Enter the phone number")
    new_email_id = st.text_input("Enter the email id")
    new_age= st.text_input("Enter the age")
    new_gym_id= st.text_input("Enter the gym id")
    new_payment_type = st.selectbox(
    'Select the payment type',
    (payment_type_list))
    date_p = st.date_input('Enter the new payment date ')
    new_amount = st.text_input('Enter the new amount to be paid')
    if st.button("Submit",key="17"):
        try:
            query = "CALL add_new_user(%s, %s, %s, %s,%s,%s,%s,%s,%s,%s,%s);"
            cur.execute(query, (new_user_name,new_street,new_city,new_zip,new_phone_no,new_email_id,new_age,new_gym_id,new_payment_type,date_p,new_amount))
            db.commit()
            st.text("Record created succssfully!")
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')


if st.button("Add new trainer",key="18") or session_state.proc12:
    session_state.proc12=True

    trainer_name=st.text_input("Enter the trainer's name")
    certification = st.text_input("Enter the certification")
    speciality = st.text_input("Enter the speciality")
    city = st.text_input("Enter the city")
    phone_no = st.text_input("Enter the zip")
    email_id = st.text_input("Enter the phone number")
    age= st.text_input("Enter the working hours")
    gym_id= st.text_input("Enter the gym id")
    if st.button("Submit",key="19"):
        try:
            query = "CALL add_trainer(%s, %s, %s, %s,%s,%s,%s,%s);"
            cur.execute(query, (trainer_name,certification,speciality,city,phone_no,email_id,age,gym_id))
            db.commit()
            st.text("Record created succssfully!")
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Delete user",key="20") or session_state.proc13:
    session_state.proc13=True

    del_user=st.text_input("Enter the user id for the user that needs to be deleted","1")
    
    if st.button("Submit",key="21"):
        try:
            query = "CALL delete_user_details(%s);"
            cur.execute(query, (del_user))
            db.commit()
            st.text("Record deleted succssfully!")
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Delete trainer",key="22") or session_state.proc14:
    session_state.proc14=True

    del_trainer=st.text_input("Enter the trainer id for the trainer that needs to be deleted","1")
    
    if st.button("Submit",key="23"):
        try:
            query = "CALL delete_trainer(%s);"
            cur.execute(query, (del_trainer))
            db.commit()
            st.text("Record deleted succssfully!")
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')


