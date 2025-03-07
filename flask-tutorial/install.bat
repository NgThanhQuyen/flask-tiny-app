@echo off
echo 🚀 Bat dau cai dat Flask project...

:: 1️⃣ Tao moi truong ao neu chua co
if not exist venv (
    echo 📦 Dang tao moi truong ao...
    python -m venv venv
)

:: 2️⃣ Kich hoat moi truong ao
call venv\Scripts\activate

:: 3️⃣ Cai dat thu vien can thiet
if exist requirements.txt (
    echo 📌 Dang cai dat cac thu vien tu requirements.txt...
    pip install -r requirements.txt
) else (
    echo ⚠️ Khong tim thay file requirements.txt! Dang cai dat Flask...
    pip install flask
)

:: 4️⃣ Khoi tao database
echo 🗄️ Khoi tao database...
flask --app flaskr init-db

:: 5️⃣ Chay server Flask
echo ✅ Cai dat hoan tat! Dang khoi chay server...
flask --app flaskr run --host=0.0.0.0 --port=5000
