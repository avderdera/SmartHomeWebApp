#!C:\Users\avder\AppData\Local\Programs\Python\Python39\python.exe

import sys
import paho.mqtt.client as paho
import time
broker="MQTT BROKER"
port=1883
def on_publish(client,userdata,result):             #create function for callback
    print("data published \n")
    pass
client1 = paho.Client("control1")                           #create client object
client1.on_publish = on_publish 
client1.username_pw_set(username= "", password= "")                         #assign function to callback
client1.connect(broker,port)        
time.sleep(0.2)                         #establish connection
ret= client1.publish("/arduino/switch2","true")  
time.sleep(0.2)
client1.disconnect(broker,port)
sys.exit()