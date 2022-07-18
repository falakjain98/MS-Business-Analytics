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
# App 1
# Working with HTML components
# Header text, paragraph, and itemized list, and a link
# HTML Styles: https://www.w3schools.com/html/html_styles.asp
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 


# comment the following line if you are using Jupyter Notebook
app = dash.Dash(__name__)

# Uncomment if using Jupyter Notebook
#app = JupyterDash(__name__)

app.layout = html.Div(children = [
    html.H1('Poverty And Equity Database', style={'color': 'blue', 'fontSize': '40px'}),
    html.H2('The World Bank'),
    html.P('Key Facts:'),
    html.Ul([
        html.Li('Number of Economies: 170'),
        html.Li('Temporal Coverage: 1974 - 2019'),
        html.Li('Update Frequency: Quarterly'),
        html.Li('Last Updated: March 18, 2020'),
        html.Li(['Source: ',
                 html.A('https://datacatalog.worldbank.org/dataset/poverty-and-equity-database',
                 href='https://datacatalog.worldbank.org/dataset/poverty-and-equity-database')
                 ])
            ])

])

# Uncomment the following two lines if using Jupyter Notebook
# if __name__ == '__main__':
#     app.run_server(mode='inline', height= 300, width = '80%')

# modes: external, inline, or jupyterlab

# Commnet the following two lines if using Jupyter Notebook
if __name__ == '__main__':
    app.run_server(debug=True)

# #############################################################################


# #############################################################################
# App 2
# Working with Themes (Bootstrap component)
# Themes, Bootstrap dash component,  
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 
# Bootstrap Documentation: https://dash-bootstrap-components.opensource.faculty.ai/docs/quickstart/
# Theme Explorer: https://dash-bootstrap-components.opensource.faculty.ai/docs/themes/explorer/

# 1. Define the app
app = dash.Dash(__name__, external_stylesheets = [dbc.themes.CERULEAN])

app.layout = html.Div(children = [
    html.H1('Poverty And Equity Database', style={'color': 'blue', 'fontSize': '40px'}),
    html.H2('The World Bank'),
    html.P('Key Facts:'),
    html.Ul([
        html.Li('Number of Economies: 170'),
        html.Li('Temporal Coverage: 1974 - 2019'),
        html.Li('Update Frequency: Quarterly'),
        html.Li('Last Updated: March 18, 2020'),
        html.Li(['Source: ',
                 html.A('https://datacatalog.worldbank.org/dataset/poverty-and-equity-database',
                 href='https://datacatalog.worldbank.org/dataset/poverty-and-equity-database')
                 ])
            ])

])

# run the app
if __name__ == '__main__':
    app.run_server(debug=True)
# #############################################################################

# #############################################################################
# App 3
# Understanding the Dashboard Grid
# Grid  
# There are a max of 12 columns on the grid
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 
# Bootstrap Documentation: https://dash-bootstrap-components.opensource.faculty.ai/docs/quickstart/

# 1. Define the app
import dash
import dash_html_components as html
import dash_bootstrap_components as dbc

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

app.layout = dbc.Col(children = [
    html.H1('Poverty And Equity Database', style={'color': 'blue', 'fontSize': '40px'}),
    html.H2('The World Bank'),
    html.P('Key Facts:'),
    html.Ul([
        html.Li('Number of Economies: 170'),
        html.Li('Temporal Coverage: 1974 - 2019'),
        html.Li('Update Frequency: Quarterly'),
        html.Li('Last Updated: March 18, 2020'),
        html.Li(['Source: ',
                 html.A('https://datacatalog.worldbank.org/dataset/poverty-and-equity-database',
                 href='https://datacatalog.worldbank.org/dataset/poverty-and-equity-database')
                 ])
            ])

], lg =12, md = 6)


if __name__ == '__main__':
    app.run_server(debug=True)
# #############################################################################

# #############################################################################
# App 4
# Adding Tabs (Bootstrap component)
# Tabs  
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 
# Bootstrap Documentation: https://dash-bootstrap-components.opensource.faculty.ai/docs/quickstart/

# 1. Define the app
import dash
import dash_html_components as html
import dash_bootstrap_components as dbc

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

app.layout = html.Div([
    html.H1('Poverty And Equity Database',
            style={'color': 'blue',
                   'fontSize': '40px'}),
    html.H2('The World Bank'),
    dbc.Tabs([
       dbc.Tab([
           html.Ul([
               html.Br(),
               html.Li('Number of Economies: 170'),
               html.Li('Temporal Coverage: 1974 - 2019'),
               html.Li('Update Frequency: Quarterly'),
               html.Li('Last Updated: March 18, 2020'),
               html.Li([
                   'Source: ',
                   html.A('https://datacatalog.worldbank.org/dataset/poverty-and-equity-database',
                          href='https://datacatalog.worldbank.org/dataset/poverty-and-equity-database')
               ])
           ])

       ], label='Key Facts'),
        dbc.Tab([
            html.Ul([
                html.Br(),
                html.Li('Book title: Interactive Dashboards and Data Apps with Plotly and Dash'),
                html.Li(['GitHub repo: ',
                         html.A('https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash',
                                href='https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash')
                         ])
            ])
        ], label='Project Info')
    ]),
])


if __name__ == '__main__':
    app.run_server(debug=True)
# #############################################################################

# #############################################################################
# App 5: Adding Interactions (Single Input/ Single Output)
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 
# Bootstrap Documentation: https://dash-bootstrap-components.opensource.faculty.ai/docs/quickstart/

# 1. Define the app
import dash
import dash_html_components as html
import dash_bootstrap_components as dbc

# comment the following line if you are using Jupyter Notebook
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Uncomment if using Jupyter Notebook
#app = JupyterDash(__name__)

app.layout = html.Div([
    dcc.Dropdown(id='color_dropdown',
                 options=[{'label': color, 'value': color}
                          for color in ['blue', 'green', 'yellow']]),
    html.Br(),
    html.Div(id='color_output')
])

@app.callback(Output('color_output', 'children'),
              Input('color_dropdown', 'value'))
def display_selected_color(color):
    if color is None:
        color = 'nothing'
    return 'You selected ' + color

# Uncomment the following two lines if using Jupyter Notebook
# if __name__ == '__main__':
#     app.run_server(mode='inline', height= 300, width = '80%')

# modes: external, inline, or jupyterlab

# Commnet the following two lines if using Jupyter Notebook
if __name__ == '__main__':
    app.run_server(debug=True)
# #############################################################################



# #############################################################################
# EX1 
# Source: https://github.com/PacktPublishing/Interactive-Dashboards-and-Data-Apps-with-Plotly-and-Dash 
# Bootstrap Documentation: https://dash-bootstrap-components.opensource.faculty.ai/docs/quickstart/

# 1. Define the app
import dash
import dash_html_components as html
import dash_bootstrap_components as dbc

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

data = pd.read_csv('app6.csv')
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


# #############################################################################
# App 6: Working with Graphs
# Source: https://dash.plotly.com/basic-callbacks

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

app.layout = html.Div([
    dcc.Graph(id='graph-with-slider'),
    dcc.Slider(
        id='year-slider',
        min=df['year'].min(),
        max=df['year'].max(),
        value=df['year'].min(),
        marks={str(year): str(year) for year in df['year'].unique()},
        step=None
    )
])

@app.callback(
    Output('graph-with-slider', 'figure'),
    Input('year-slider', 'value'))
def update_figure(year):
    df_year = df.loc[df['year']== year]
    fig = px.scatter(df_year, x  = 'gdpPercap', 
                              y = 'lifeExp', 
                              size = 'pop',
                              color = 'continent',
                              hover_name = 'country', 
                              log_x= True, size_max= 55)
    return fig

if __name__ == '__main__':
    app.run_server(debug=True)
# ############################################################################



# #############################################################################
# App 7: Multiple Input, One Output
# Source: https://dash.plotly.com/basic-callbacks

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# read the data
df = pd.read_csv('https://plotly.github.io/datasets/country_indicators.csv')

# list of all indicators
available_indicators = df['Indicator Name'].unique()

app.layout = html.Div([

    # top left drop menu and radio items together in one division
    html.Div([
            dcc.Dropdown(
                id='xaxis-column',
                options=[{'label': i, 'value': i} for i in available_indicators],
                value='Fertility rate, total (births per woman)'
            ),
            dcc.RadioItems(
                id='xaxis-type',
                options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                value='Linear',
                labelStyle={'display': 'inline-block'}
            )        
    ], style={'width': '48%', 'display': 'inline-block'}), 

    # top right drop menu and radio items together in one division
    html.Div([
            dcc.Dropdown(
                id='yaxis-column',
                options=[{'label': i, 'value': i} for i in available_indicators],
                value='Life expectancy at birth, total (years)'
            ),
            dcc.RadioItems(
                id='yaxis-type',
                options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                value='Linear',
                labelStyle={'display': 'inline-block'}
            )        
    ], style={'width': '48%', 'float': 'right', 'display': 'inline-block'}),

    dcc.Graph(id='indicator-graphic'),
    dcc.Slider(
        id='year--slider',
        min=df['Year'].min(),
        max=df['Year'].max(),
        value=df['Year'].min(),
        marks={str(year): str(year) for year in df['Year'].unique()},
        step=None
    )
])

@app.callback(
    Output('indicator-graphic', 'figure'),
    Input('xaxis-column', 'value'),
    Input('yaxis-column', 'value'),
    Input('xaxis-type', 'value'),
    Input('yaxis-type', 'value'),
    Input('year--slider', 'value'))
def update_graph(xaxis_column_name, yaxis_column_name, xaxis_type, yaxis_type, year_value):

    df_year = df[df['Year'] == year_value]

    fig = px.scatter(x=df_year[df_year['Indicator Name'] == xaxis_column_name]['Value'],
                     y=df_year[df_year['Indicator Name'] == yaxis_column_name]['Value'],
                     hover_name=df_year[df_year['Indicator Name'] == yaxis_column_name]['Country Name'])

    fig.update_layout(margin={'l': 40, 'b': 40, 't': 10, 'r': 0}, hovermode='closest')

    fig.update_xaxes(title=xaxis_column_name,
                     type='linear' if xaxis_type == 'Linear' else 'log')

    fig.update_yaxes(title=yaxis_column_name,
                     type='linear' if yaxis_type == 'Linear' else 'log')

    return fig


if __name__ == '__main__':
    app.run_server(debug=True)
# ############################################################################



# #############################################################################
# App 8: Crossfiltering between graphs
# Source: https://dash.plotly.com/basic-callbacks

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# list of all indicators
available_indicators = df['Indicator Name'].unique()

app.layout = html.Div([

# Top part of the dashboard
# It has two subdivisions (left and right subdivisions)
html.Div([
    # top left division: dropdown menu and radio buttons
    html.Div([
            dcc.Dropdown(
                id='crossfilter-xaxis-column',
                options=[{'label': i, 'value': i} for i in available_indicators],
                value='Fertility rate, total (births per woman)'
            ),
            dcc.RadioItems(
                id='crossfilter-xaxis-type',
                options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                value='Linear',
                labelStyle={'display': 'inline-block', 'marginTop': '5px'}
            )
    ], style={'width': '49%', 'display': 'inline-block'}), 

   # top right division: dropdown menu and radio buttons
    html.Div([
            dcc.Dropdown(
                id='crossfilter-yaxis-column',
                options=[{'label': i, 'value': i} for i in available_indicators],
                value='Life expectancy at birth, total (years)'
            ),
            dcc.RadioItems(
                id='crossfilter-yaxis-type',
                options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                value='Linear',
                labelStyle={'display': 'inline-block', 'marginTop': '5px'}
            )
    ], style={'width': '49%', 'float': 'right', 'display': 'inline-block'})

], style={'padding': '10px 5px'}), 

# division to show the scatter plot in bottom left
html.Div([
    dcc.Graph(
        id='crossfilter-indicator-scatter',
        hoverData={'points': [{'customdata': 'Japan'}]}
    )
], style={'width': '49%', 'display': 'inline-block', 'padding': '0 20'}),

# division to show both time series to the right side of the scatter plot 
html.Div([
    dcc.Graph(id='x-time-series'),
    dcc.Graph(id='y-time-series'),
], style={'display': 'inline-block', 'width': '49%'}),

# division to show the slider
html.Div(dcc.Slider(
    id='crossfilter-year--slider',
    min=df['Year'].min(),
    max=df['Year'].max(),
    value=df['Year'].max(),
    marks={str(year): str(year) for year in df['Year'].unique()},
    step=None
), style={'width': '49%', 'padding': '0px 20px 20px 20px'})

])

# define callback for updating the scatterplot 
@app.callback(
    dash.dependencies.Output('crossfilter-indicator-scatter', 'figure'),
    [dash.dependencies.Input('crossfilter-xaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-xaxis-type', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-type', 'value'),
     dash.dependencies.Input('crossfilter-year--slider', 'value')])
def update_graph(xaxis_column_name, yaxis_column_name,
                 xaxis_type, yaxis_type,
                 year_value):
    dff = df[df['Year'] == year_value]

    fig = px.scatter(x=dff[dff['Indicator Name'] == xaxis_column_name]['Value'],
            y=dff[dff['Indicator Name'] == yaxis_column_name]['Value'],
            hover_name=dff[dff['Indicator Name'] == yaxis_column_name]['Country Name']
            )

    fig.update_traces(customdata=dff[dff['Indicator Name'] == yaxis_column_name]['Country Name'])

    fig.update_xaxes(title=xaxis_column_name, type='linear' if xaxis_type == 'Linear' else 'log')

    fig.update_yaxes(title=yaxis_column_name, type='linear' if yaxis_type == 'Linear' else 'log')

    fig.update_layout(margin={'l': 40, 'b': 40, 't': 10, 'r': 0}, hovermode='closest')

    return fig
    
# create a general utility function to create a time series plot 
def create_time_series(dff, axis_type, title):

    fig = px.scatter(dff, x='Year', y='Value')
    fig.update_traces(mode='lines+markers')
    fig.update_xaxes(showgrid=False)
    fig.update_yaxes(type='linear' if axis_type == 'Linear' else 'log')
    fig.add_annotation(x=0, y=0.85, xanchor='left', yanchor='bottom',
                       xref='paper', yref='paper', showarrow=False, align='left',
                       text=title)
    fig.update_layout(height=225, margin={'l': 20, 'b': 30, 'r': 10, 't': 10})

    return fig

# define callback for updating time series for the x-axis data
@app.callback(
    dash.dependencies.Output('x-time-series', 'figure'),
    [dash.dependencies.Input('crossfilter-indicator-scatter', 'hoverData'),
     dash.dependencies.Input('crossfilter-xaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-xaxis-type', 'value')])
def update_y_timeseries(hoverData, xaxis_column_name, axis_type):
    country_name = hoverData['points'][0]['customdata']
    dff = df[df['Country Name'] == country_name]
    dff = dff[dff['Indicator Name'] == xaxis_column_name]
    title = '<b>{}</b><br>{}'.format(country_name, xaxis_column_name)
    return create_time_series(dff, axis_type, title)

# define callback for updating time series for the y-axis data
@app.callback(
    dash.dependencies.Output('y-time-series', 'figure'),
    [dash.dependencies.Input('crossfilter-indicator-scatter', 'hoverData'),
     dash.dependencies.Input('crossfilter-yaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-type', 'value')])
def update_x_timeseries(hoverData, yaxis_column_name, axis_type):
    dff = df[df['Country Name'] == hoverData['points'][0]['customdata']]
    dff = dff[dff['Indicator Name'] == yaxis_column_name]
    return create_time_series(dff, axis_type, yaxis_column_name)


if __name__ == '__main__':
    app.run_server(debug=True)
# ############################################################################


# #############################################################################
# App 
# Source: https://dash.plotly.com/basic-callbacks

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])


if __name__ == '__main__':
    app.run_server(debug=True)
# ############################################################################



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

