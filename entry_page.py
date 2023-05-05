import streamlit as st
from PIL import Image


st.set_page_config(
    page_title="DBMS Project"
)

st.write("# FITNESS AND GYM TRACKING DATABASE")

st.sidebar.success("Select a page above.")

image = Image.open('C:/Users/prana/Downloads/gym.jpg')
st.image(image)
st.markdown(
    """
   A fitness and gym tracking database are a system for managing and storing information about
workouts and gym memberships. Users can track their progress, establish and meet fitness goals, and
keep tabs on their general health and wellbeing with the aid of this database applying. A wide range of
data, including exercise logs, nutritional data, etc., can be stored in the database. Additionally, it can
store data about gym memberships, including the type of membership, the date of renewal, and
payment details. Users can use it to set and reach their fitness goals, track their advancement, and
maintain motivation throughout their fitness journey.

"""
)