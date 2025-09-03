# Dashboard de Análise de Sites (Dash/Plotly)

## Como configurar
1) Coloque o Excel na mesma pasta do projeto **ou** defina a variável de ambiente `EXCEL_PATH`.
2) Instale dependências e rode localmente:
```bash
python -m venv venv
source venv/bin/activate    # Windows: venv\Scripts\activate
pip install -r requirements.txt
# opcional: export DASH_DEBUG=1
python dashboard_melhorado.py
```
Acesse: http://127.0.0.1:8050/

## Deploy (Render/Heroku)
- Build: `pip install -r requirements.txt`
- Start: `gunicorn dashboard_melhorado:app.server`
- Defina a variável `EXCEL_PATH` no painel da plataforma, se não for subir o Excel junto.
