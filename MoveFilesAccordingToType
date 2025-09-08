import os
import shutil
import pandas as pd
import numpy as np

files = os.listdir("C:\\Users\\r4029006\\Downloads\\PythonLearnings")

os.makedirs("C:\\Users\\r4029006\\Downloads\\PythonLearnings\\csvFiles",exist_ok=True)

SourcePath = "C:\\Users\\r4029006\\Downloads\\PythonLearnings\\"

extention = (pd.DataFrame(files)[0].str.split('.').str[1].dropna().unique())

for ext in extention:
    
    for file1 in files:
        if file1.endswith(ext):
            print(file1)
            os.makedirs(("C:\\Users\\r4029006\\Downloads\\PythonLearnings\\" + ext + '\\'),exist_ok=True)
            DestinationPath = 'C:\\Users\\r4029006\\Downloads\\PythonLearnings\\' + ext + '\\'
            shutil.move((SourcePath + file1) , (DestinationPath + file1))
      
