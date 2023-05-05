import mysql.connector
import streamlit as st
import pandas as pd
import numpy as np
from PIL import Image
import json
import pymysql as sql

with open("config.json", "r") as jsonfile:
    data = json.load(jsonfile)
    #print("Read successful")

db = sql.connect(host='localhost',user=data["username"],password=data["password"],database='fitness_tracker',charset='utf8mb4',cursorclass=sql.cursors.DictCursor)

cur = db.cursor()

cur.execute("SHOW TABLES")
tables = []
#print(cur.fetchall())
for table_name in cur.fetchall():
    #print(table_name)
    tables.append(table_name['Tables_in_fitness_tracker'])
#print(tables)

st.title("TABLES")
for table in tables:
    query="SELECT * FROM {}".format(table)
    df = pd.read_sql(query, db)
    if "date" in df.columns: 
        df["date"] = df["date"].astype(str)
    if "duration" in df.columns:
        
        df["duration"] = df["duration"].astype(str)
        print(df["duration"])
        df["duration"]=df["duration"].str.replace("0 days ","")

    
    if st.button(table):
        st.dataframe(df)
db.close()
