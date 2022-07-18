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
import dash_bootstrap_components as dbc
from datetime import date

# #############################################################################
# App 5: Adding Interactions (Single Input/ Single Output)
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 
# Bootstrap Documentation: https://dash-bootstrap-components.opensource.faculty.ai/docs/quickstart/

# 1. Define the app
import dash
import dash_html_components as html
import dash_bootstrap_components as dbc

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

data = pd.read_csv('ex1.csv')
data2010 =  data.loc[data['year'] == '2010', :]

app.layout = html.Div([
    dcc.Dropdown(id='country_dropdown',
                 options=[{'label': country, 'value': country}
                          for country in data2010['Country Name']]),
    html.Br(),
    html.Div(id='country_output')
])

@app.callback(Output('country_output', 'children'),
              Input('country_dropdown', 'value'))
def display_selected_color(country):
    if country is None:
        return ''
    return 'The population of {} in 2010 is {}'.format(country, data2010.loc[data2010['Country Name'] == country, 'population'].values[0])


if __name__ == '__main__':
    app.run_server(debug=True)
# #############################################################################