import streamlit as st
import pymysql as sql
from streamlit import session_state
import mysql.connector
from datetime import datetime,time,timedelta
import json

st.title("Trainer functions")

with open("config.json", "r") as jsonfile:
    data = json.load(jsonfile)
    print("Read successful")


try:
    db = sql.connect(host='localhost',user=data["username"],password=data["password"],database='fitness_tracker',charset='utf8mb4',cursorclass=sql.cursors.DictCursor)
except:
    st.warning("Please try again")
cur = db.cursor()


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


if st.button("User Details",key="1") or session_state.proc1:
    session_state.proc1=True
    user_details= st.text_input('Enter the User ID to display their details',"1" )
    
    if st.button("Submit",key="2"):
        try:
            cur.callproc('user_details', [user_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')
if st.button("User trainer details",key="3") or session_state.proc2:
    session_state.proc2=True
    user_trainer_details= st.text_input('Enter the Trainer ID to display trainer details',"1" )
    if st.button("Submit",key="4"):
        try:
            cur.callproc('user_trainer_details',[user_trainer_details])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Display exercises",key="5") or session_state.proc3:
    session_state.proc3=True
    result_list=[]
    cur.execute("select workout_type from workout")
    result=cur.fetchall()
    for i in result:
        result_list.append(i['workout_type'])
    option = st.selectbox(
    'Select workout type to display exercises',
    (result_list))
    try:
        cur.callproc('exercise_workout_type',[option])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
        error_message = str(e).split("'")[1]
        st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Trainer group details",key="6") or session_state.proc4:
    session_state.proc4=True
    trainer_group_details= st.text_input("Select trainer ID to get trainer group details","1")
    if st.button("Submit",key="7"):
        try:
            cur.callproc('trainer_group_details', [trainer_group_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Trainer personal details",key="8") or session_state.proc5:
    session_state.proc5=True
    trainer_personal_details= st.text_input("Select trainer ID to get trainer personal details","1")
    if st.button("Submit",key="9"):
        try:
            cur.callproc('trainer_personal_details', [trainer_personal_details,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Group session details",key="10") or session_state.proc6:
    session_state.proc6=True
    group_session_details= st.slider('Slide to the Group ID to display detials',1,10,1)
    try:
        cur.callproc('group_session_details',[group_session_details])
        st.dataframe(cur.fetchall(),width=1500)
    except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')
    






