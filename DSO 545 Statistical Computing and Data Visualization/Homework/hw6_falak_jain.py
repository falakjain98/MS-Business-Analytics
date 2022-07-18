# data manipulation
from os import truncate
import pandas as pd
import numpy as np
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

df1 = pd.read_csv('population.csv')
df2 = pd.read_csv('statecodes.csv')
df = df1.merge(df2,how = 'inner',right_on = 'State',left_on = 'state').drop('state',axis = 1)

years = {}
year_range = range(1960,2011,5)

for i in range(1960,2011,5):
    years[i] = str(i)

app = dash.Dash(__name__)

app.layout = html.Div(children=[
    html.H1(children='Population of the US over the Years',style={
        'color':'dark-grey','fontsize':'40px'}),

    dcc.Graph(
        id='example-graph',
    ),
    
    dcc.Slider(
        id='my-slider',
        min=1960,
        max=2010,
        step=5,
        value=1960,
        marks=years,
    ),
])

@app.callback(
    Output('example-graph', 'figure'),
    Input('my-slider', 'value'))
def update_output(year):
    
    df_year = df.loc[df['Year'] == year]
    
    for col in df_year.columns:
        df_year[col] = df_year[col].astype(str)
        
    df_year['text'] = df_year['State'] + '<br>' + 'Population' + df_year['Population']
    
    fig = go.Figure(data = go.Choropleth(
                    locations=df_year['Code'],
                    z = df_year['Population'].astype(int),
                    locationmode = 'USA-states',
                    colorscale='Reds',
                    autocolorscale = False,
                    text = df_year['text'],
                    marker_line_color = 'white',
                    colorbar_title='Population'))
    
    fig.update_layout(
        geo = dict(
            scope = 'usa',
            projection = go.layout.geo.Projection(type = 'albers usa'),
            showlakes = True,
            lakecolor = 'rgb(255,255,255)'
        )
    )
    
    return fig

if __name__ == '__main__':
    app.run_server(debug=True)