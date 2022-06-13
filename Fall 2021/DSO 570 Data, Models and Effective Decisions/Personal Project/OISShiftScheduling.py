#python3
# OISShiftScheduling.py - Using linear optimization to schedule shifts in an office

# Importing modules
import pandas as pd
import numpy as np
from gurobipy import Model, GRB
from tkinter import *
from tkinter import messagebox
#from db import Database #module not required

# Defining optimization function
def assignSchedule(inputFile, k, outputFile):
    preferences = pd.read_excel(inputFile, sheet_name = "Preferences",index_col = 0)
    reqs = pd.read_excel(inputFile, sheet_name = "Requirements", index_col = 0)
    limits = pd.read_excel(inputFile, sheet_name = "Limits", index_col = 0)
    students = preferences.index
    shifts = preferences.columns
    shift_ids = reqs.index
    mod = Model()
    x = mod.addVars(students,shifts,vtype = GRB.BINARY,name = 'x')
    L = mod.addVar()
    mod.setObjective(sum(preferences.loc[i,s]*x[i,s] for i in students for s in shifts), sense = GRB.MAXIMIZE)
    # Shift requirement
    for si in shift_ids:
        mod.addConstr(sum(x[i,shifts[si]] for i in students) == reqs.loc[si,'persons'])
    # Total shift limit
    for i in students:
        mod.addConstr(sum(x[i,s] for s in shifts)<=limits.loc[i,'Limit'])
    # No consecutive shifts in a day
    morning_shift_ids = shift_ids[::2]
    for ms in morning_shift_ids:
        for i in students:
            mod.addConstr(x[i,shifts[ms]] + x[i,shifts[ms+1]] <= 1)
    # Preferences:
    for i in students:
        for s in shifts:
            mod.addConstr(x[i,s] <= preferences.loc[i,s])
    # Fairness:
    for i in students:
        mod.addConstr(sum(x[i,s] for s in shifts) <= L+k)
        mod.addConstr(sum(x[i,s] for s in shifts) >= L)
    mod.setParam("OutputFlag", False)
    mod.optimize()
    df = pd.DataFrame(index = preferences.index,columns = preferences.columns)
    for i in students:
        for s in shifts:
            df.loc[i,s] = int(x[i,s].x)
    writer = pd.ExcelWriter(outputFile)
    df.to_excel(writer, sheet_name = "Schedule", index = True)
    print(df)
    writer.save()

"""
# Creating tkinter object
app = Tk()
"""

'''# Defining function for tkinter input
def display_text():
   global entry
   string= entry.get()
   label.configure(text=string)'''

# Assigning input file from tkinter
'''# Initialize a Label to display the User Input
label=Label(app, text="Enter Input File", font=("Courier 22 bold"))
label.pack()

# Create an Entry widget to accept User Input
entry= Entry(app, width= 40)
entry.focus_set()
entry.pack()

#Create a Button to validate Entry Widget
add_btn = Button(app, text= "Okay",width= 20, command= display_text).pack(pady=20)
root = Tk()
root.title("lol")
root.geometry("400x400")

input = Entry(root)
input.pack()

root.mainloop()
'''
    
# Calling the scheduling function
assignSchedule("OIS-Availability.xlsx",1,"OIS-Schedule.xlsx")