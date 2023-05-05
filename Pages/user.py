import streamlit as st
import pymysql as sql
from streamlit import session_state
import mysql.connector
from datetime import datetime,time,timedelta
import json

st.title("User functions")

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



if st.button("Update user BMI",key="1") or session_state.proc1:
    session_state.proc1=True
    user_id_1=st.text_input(
    'Enter user id to update')
    height_p = st.selectbox(
    'Select the new height',
    (range(140,200))) 
    weight_p = st.selectbox(
    'Select the new weight',
    (range(50,100))) 
    date_p = st.date_input('Select date to update ')
    if st.button("Submit",key="2"):
        try:
            query = "CALL update_user_bmi(%s, %s, %s, %s);"
            cur.execute(query, (user_id_1, height_p, weight_p, date_p))
            db.commit()
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button('Calculate BMI',key="3") or session_state.proc2:
    session_state.proc2=True
    #click_count_proc1 += 1
    #st.session_state["click_count_proc1"] = click_count_proc1
    user_id_2=st.text_input('Enter user id to calculate BMI')
    if st.button("Submit",key="4"):
        try:

            cur.callproc('calculate_bmi', [user_id_2,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')


if st.button("User nutrition",key="5") or session_state.proc3:
    session_state.proc3=True
    user_id_3=st.text_input(
    'Enter user id to get user nutrition')
    if st.button("Submit",key="6"):
        try:
            cur.callproc('user_nutrition', [user_id_3,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Update user nutirtion",key="7") or session_state.proc4:
    session_state.proc4=True
    user_id_4=st.text_input(
    'Enter user id to get user nutrition')
    serving_size = st.selectbox(
    'Select the serving size in mg',
    (range(100,300))) 
    calories = st.selectbox(
    'Select the calories',
    (range(50,1000))) 
    nutrition = st.text_input("Enter the nutrition")
    allergens_list=["None","Gluten","Nuts","Dairy","Peanuts","Soy"]
    allergens = st.selectbox(
    'Select allergens if any',
    (allergens_list))
    date_p = st.date_input('Select date to update ')
    if st.button("Submit",key="8"):
        try:
            query = "CALL update_user_nutrition(%s, %s, %s, %s,%s,%s);"
            cur.execute(query, (user_id_4,serving_size,calories,nutrition,allergens,date_p))
            db.commit()
            st.write("Record updated successfully")
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

# if st.button("Check sleep duration") or session_state.proc5:
#     session_state.proc5=True
#     user_id=st.text_input(
#     'Enter user id to get user nutrition')
#     if st.button("Submit"):
#         cur.callproc('check_sleep_duration',[user_id])
#         st.dataframe(cur.fetchall(),width=1500)

if st.button("Check User Rewards",key="9") or session_state.proc5:
    session_state.proc5=True
    user_id_5=st.text_input(
    'Enter user id to get user nutrition')
    if st.button("Submit",key="10"):
        try:
            cur.callproc('check_reward', [user_id_5,])
            st.dataframe(cur.fetchall(),width=1500)
        except sql.OperationalError as e:
            error_message = str(e).split("'")[1]
            st.warning(error_message, icon = '\u26A0\ufe0f')

if st.button("Display exercises",key="11") or session_state.proc6:
    session_state.proc6=True
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



