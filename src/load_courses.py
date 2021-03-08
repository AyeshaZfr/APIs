# load_courses.py

import urllib.request
from bs4 import BeautifulSoup
from  configparser import ConfigParser
import pymysql

def get_config(fn):
	parser = ConfigParser()
	parser.read(fn)
	db = parser.items('db')
	return {name: value for name, value in db}


conf = get_config('/home/az1866/csci60-hw07/config.ini')

print(conf)

def get_config(conf):
	conn = pymysql.connect(**conf, cursorclass=pymysql.cursors.DictCursor)
	return conn

conn = get_config(conf)


def insert(conn, course_num, course_name, professor_name, office_hours, meet_day, meet_time,description, pre_req, semester):
    cursor = conn.cursor()
    mySql_insert_query = 'INSERT INTO courses VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s )'
    recordTuple = (course_num, course_name, professor_name, office_hours, meet_day, meet_time, description, pre_req, semester)
    cursor.execute(mySql_insert_query, recordTuple)
    conn.commit()


fall2020 = 'https://cs.nyu.edu/dynamic/courses/schedule/?semester=fall_2020'
spring2020 = 'https://cs.nyu.edu/dynamic/courses/schedule/?semester=spring_2020'

responsefall = urllib.request.urlopen(fall2020)
responsespring = urllib.request.urlopen(spring2020)

fall_html =  responsefall.read().decode('utf-8')
spring_html =  responsespring.read().decode('utf-8')

dom = BeautifulSoup(fall_html, 'html.parser')
dom2 = BeautifulSoup(spring_html, 'html.parser')

table = []

list1 =  dom.select_one('ul.schedule-listing').select('li.row')

list2 =  dom2.select_one('ul.schedule-listing').select('li.row')


for info in list1:
    data = []
    span = info.select('div span')
    
    class_id = span[0].get_text().split()

    data.append((class_id[0]).replace('\u200b', ''))

    class_name = span[1].a.get_text()
    data.append(' '.join(class_name.split()))

    professor_name = span[2].get_text().strip().replace("CANCELLED", "NULL")
    data.append(professor_name[0:professor_name.find("Office Hours")].replace('\n',''))


    if "Office Hours" in professor_name:
        data.append(1)
    else:
        data.append(0)
    
    meet_time = span[3].get_text().strip().split()
    
    if meet_time[0]:
        data.append(meet_time[0])
    else:
        data.append("NULL")   

    if len(meet_time)>1:
        data.append(meet_time[-1])
    else:
        data.append("NULL")     

    description = span[-1].get_text().strip().split('\n')

    if description[0] and "Prerequisites:" not in description[0]: 
        data.append(description[0])
    else:
        data.append("NULL")
        

    if "Prerequisites:" in description[-1]:
        data.append(description[-1])
    else:
        data.append("NULL")

    room = span[4].get_text().strip()
    if room:
        data.append(room)
    else:
        data.append("NULL")

    insert(conn, data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], "Fall2020")

    table.append(data)

# -----------------------------------------------

for info in list2:
    data = []
    span = info.select('div span')

    class_id = span[0].get_text().split()
    data.append((class_id[0]).replace('\u200b', ''))

    class_name = span[1].a.get_text().strip()
    data.append(' '.join(class_name.split()))
    

    professor_name = span[2].get_text().strip().replace("CANCELLED", "NULL")
    data.append(professor_name[0:professor_name.find("Office Hours")].strip())

    if "Office Hours" in professor_name:
        data.append(1)
    else:
        data.append(0)
    
    meet_time = span[3].get_text()

    data.append(meet_time[0]) 
    data.append(meet_time[1]) 


    description = span[-1].get_text().strip().split('\n')
 
    if description[0] and "Prerequisites:" not in description[0]: 
        data.append(description[0])
    else:
        data.append("NULL")


    if "Prerequisites:" in description[-1]:
        data.append(description[-1])
    else:
        data.append("NULL")


    room = span[4].get_text()
    data.append(room)
    
    insert(conn, data[0], data[1],data[2],data[3],data[4],data[5],data[6], data[7], "Spring2020")
    table.append(data)


for line in table:
    print(line ,'\n')


