# data manipulation
import pandas as pd

# plotly 
import plotly.express as px
import plotly.graph_objects as go

# dashboards
import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_table
from dash.dependencies import Input, Output
import dash_bootstrap_components as dbc
from datetime import date

# reading data
rfm = pd.read_csv('rfm.csv')

# dash
app = dash.Dash(__name__)

app.layout = html.Div(children=[
    html.H1(children='Choose one of the RFM KPIs',style={
        'color':'dark-grey','fontsize':'40px'}),
    
    dcc.Dropdown(id='kpi_dropdown',
                 options=[{'label': kpi, 'value': kpi}
                          for kpi in ['Frequency','Monetary','Recency']],
                 value = 'Recency'),
    html.Br(),
    html.Div(id='kpi_output'),

    dcc.Graph(
        id='example-graph',
    ), 
])

# dropdown input
@app.callback(
    Output('example-graph', 'figure'),
    Input('kpi_dropdown', 'value'))
def update_output(kpi):
        
    fig = px.box(rfm, y=kpi)
    
    return fig

if __name__ == '__main__':
    app.run_server(debug=True)