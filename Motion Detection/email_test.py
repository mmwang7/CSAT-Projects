#!/usr/bin/env python
# coding: utf-8

# In[1]:


import time


# In[2]:


import smtplib


# In[3]:


import email.utils


# In[4]:


from picamera import PiCamera
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage


# In[5]:


camera = PiCamera()
camera.resolution = (2592, 1944)
camera.framerate = 15


# In[6]:


msg = MIMEText("This email was sent at " + time.ctime(), "plain")


# msg['Subject'] = "Raspberry Pi"

# msg['From'] = email.utils.formataddr(("Pi", "pi@raspberrypi"))

# msg['To'] = email.utils.formataddr(("Recipient", "poppypapi6969@gmail.com"))

# ## Connect to GMAIL SMTP

# In[7]:


emailData = MIMEMultipart()
emailData['Subject'] = "detected!"
emailData['From'] = "poppypapi6969@gmail.com"
emailData['To'] = "brycky007@gmail.com"


# In[8]:


emailData.attach(msg)


# In[9]:


image = "/home/pi/Desktop/image.jpg"
camera.capture(image)
imageData = MIMEImage(open(image, 'rb').read(), 'jpg') 
imageData.add_header('Content-Disposition', 'attachment; filename="image.jpg"')
emailData.attach(imageData)


# In[10]:


server = smtplib.SMTP("smtp.gmail.com", 587)
server.ehlo()
server.starttls()
server.set_debuglevel(True)


# In[11]:


server.login("poppypapi6969@gmail.com", "Brycklen1")


# In[12]:


server.sendmail(email.utils.formataddr(("Pi", "poppypapi6969@gmail.com")), email.utils.formataddr(("Recipient", "brycky007@gmail.com")), emailData.as_string())


# In[13]:


print("EMAIL SENT")


# In[ ]:





# In[ ]:




