import tkinter as tk
import webbrowser as wb

def open_RStudio():
    wb.open_new('http://host.docker.internal:8787/')

def open_Spyder():
    wb.open_new('https://mybinder.org/v2/gh/spyder-ide/spyder/4.x?urlpath=/desktop')

def open_IBM():
    wb.open_new('https://www.pdesas.org/Profile/Account/Login')
    
def open_Git():
    wb.open_new('http://host.docker.internal:3000/')
    
def open_Jupyter():
    wb.open_new('http://host.docker.internal:8889/')
       
def open_Orange():
    wb.open_new('http://host.docker.internal:6901/')

def open_VSCode():
    wb.open_new('http://host.docker.internal:8443/')

#def open_Hadoop():
#   wb.open_new('')

def open_Spark():
    wb.open_new('http://host.docker.internal:8080/')

def open_Tableau():
    wb.open_new('https://sso.online.tableau.com/public/idp/SSO/')

#def open_Sonar():
#    wb.open_new('')

def open_TensorFlow():
    wb.open_new('http://host.docker.internal:8989?token=easy/')

def open_Markdown():
    wb.open_new('http://host.docker.internal:12345/')

window = tk.Tk()
window.title("Data Science Toolbox | Mouhammadou Dabo")
frame = tk.Frame(window)
frame.pack()

welcome = tk.Label(frame, text="Welcome to the Data Science Toolbox | Mouhammadou Dabo")
welcome.pack()

instructions = tk.Label(frame, text="Please run one of the following applications:")
instructions.pack()

RStudioButton = tk.Button(frame, text="RStudio", command=open_RStudio)
RStudioButton.pack()

SpyderButton = tk.Button(frame, text="Spyder", command=open_Spyder)
SpyderButton.pack()

IBMButton = tk.Button(frame, text="IBM SAS", command=open_IBM)
IBMButton.pack()

GitButton = tk.Button(frame, text="Git", command=open_Git)
GitButton.pack()

JupyterButton = tk.Button(frame, text="Jupyter Notebook", command=open_Jupyter)
JupyterButton.pack()

OrangeButton = tk.Button(frame, text="Orange", command=open_Orange)
OrangeButton.pack()

VSCodeButton = tk.Button(frame, text="Visual Studio Code IDE", command=open_VSCode)
VSCodeButton.pack()

#HadoopButton = tk.Button(frame, text="Apache Hadoop", command=open_Hadoop)
#HadoopButton.pack()

SparkButton = tk.Button(frame, text="Apache Spark", command=open_Spark)
SparkButton.pack()

TableauButton = tk.Button(frame, text="Tableau", command=open_Tableau)
TableauButton.pack()

#SonarButton = tk.Button(frame, text="SonarQube and SonarScanner Binarie",  command=open_Sonar)
#SonarButton.pack()

TensorflowButton = tk.Button(frame, text="Tensorflow", command=open_TensorFlow)
TensorflowButton.pack()

MarkdownButton = tk.Button(frame, text="Markdown", command=open_Markdown)
MarkdownButton.pack()

window.mainloop()