import os
from fastapi import FastAPI
from fastapi.responses import HTMLResponse

color=os.environ.get('COLOR', 'blue')

app = FastAPI()

html_content = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blue Background</title>
    <style>
        body {{
            background-color: {color};
            color: white;
            font-family: Arial, sans-serif;
            padding: 20px;
        }}
    </style>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is a FastAPI application rendering HTML with a {color} background.</p>
</body>
</html>
"""

@app.get("/", response_class=HTMLResponse)
async def read_root():
    return html_content
