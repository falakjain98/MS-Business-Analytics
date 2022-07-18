# data manipulation
import pandas as pd

# plotly 
import plotly.express as px

# dashboards
import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_table
from dash.dependencies import Input, Output

#####################################################################
# Getting inspired
# Dash Gallery: https://dash.gallery/Portal/
# Electricity Demand: https://dash.gallery/dash-peaky-finders/
# Baseball History: https://dash.gallery/dash-baseball-statistics/team
# FIFA: https://dash.gallery/dash-fifa-dashboard/
# Food Footprint: https://dash.gallery/dash-food-footprint/
# Port Analytics: https://dash.gallery/dash-port-analytics/
# Real Estate: https://dash.gallery/dash-spatial-clustering/
# Product Playbook: https://dash.gallery/product-playbook/
# SKU Product Availability: https://dash.gallery/sku-analytics/

# Dash Apps Source Code
# Github: https://github.com/plotly/dash-sample-apps 
####################################################################

##############################################################################
# Layout 1
# - create an instance of a Dash app and save it in a Python variable called app
# - app.layout describes what the app looks like
# - app.layout is a hierarchical tree pf componenets 
# - dash_html_components library provides classes for all of the HTML tags
# - dash_html_components keyword arguments describe the HTML attributes like style, className, id
# - dash_core_components library generates higher-level components like controls and graphs


##############################################################################
# Layout 2
# - create an instance of a Dash app and save it in a Python variable called app
# - app.layout describes what the app looks like
# - app.layout is a hierarchical tree pf componenets 
# - dash_html_components library provides classes for all of the HTML tags
# - dash_html_components keyword arguments describe the HTML attributes like style, className, id
# - dash_core_components library generates higher-level components like controls and graphs


# #############################################################################
# Callbacks 1
# - Callbacks are functions that are automatically called by Dash whenever an input component's property changes,
# - Callbacks update some property in another component (the output)
# - For optimum user-interaction and chart loading performance, production Dash applications should consider...
# - the Job Queue, HPC, Datashader, and horizontal scaling capabilities of Dash Enterprise.



# # define app action

# # - The "inputs" and "outputs" of our application are described as the arguments of the @app.callback decorator
# # - The inputs and outputs of our application are simply the properties of a particular component
# # - In this example, the input is the "value" property of the component that has the ID "my-input"
# # - The output is the "children" property of the component with the ID "my-output"
# # - Whenever an input property changes, the function that the callback decorator wraps will get called automatically.
# # - Dash provides this callback function with the new value of the input property as its argument, and 
# # - Dash updates the property of the output component with whatever was returned by the function.
# # - The component_id and component_property keywords are optional (there are only two arguments for each of those objects). They are included in this example for clarity but will be omitted in the rest of the documentation for the sake of brevity and readability.
# # - When the Dash app starts, it automatically calls all of the callbacks with the initial values of the input components in order to populate the initial state of the output components. 
# # - Source: https://dash.plotly.com/basic-callbacks 



##############################################################################
# Callbacks 2
# - Callbacks are functions that are automatically called by Dash whenever an input component's property changes,
# - Callbacks update some property in another component (the output)
# - For optimum user-interaction and chart loading performance, production Dash applications should consider...
# - the Job Queue, HPC, Datashader, and horizontal scaling capabilities of Dash Enterprise.


##############################################################################
# Callbacks 3
# Multiple Inputs
# - Callbacks are functions that are automatically called by Dash whenever an input component's property changes,
# - Callbacks update some property in another component (the output)
# - For optimum user-interaction and chart loading performance, production Dash applications should consider...
# - the Job Queue, HPC, Datashader, and horizontal scaling capabilities of Dash Enterprise.


##############################################################################
# Callbacks 4
# Multiple Outputs
# - Callbacks are functions that are automatically called by Dash whenever an input component's property changes,
# - Callbacks update some property in another component (the output)
# - For optimum user-interaction and chart loading performance, production Dash applications should consider...
# - the Job Queue, HPC, Datashader, and horizontal scaling capabilities of Dash Enterprise.

