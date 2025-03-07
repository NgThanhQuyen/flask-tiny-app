Write-Host "🚀 Bat dau cai dat Flask project..."

# 1️⃣ Tao moi truong ao neu chua co
if (!(Test-Path "venv")) { 
    Write-Host "📦 Dang tao moi truong ao..."
    python -m venv venv
}

# 2️⃣ Kich hoat moi truong ao
Write-Host "🔧 Kich hoat moi truong ao..."
& ".\venv\Scripts\Activate.ps1"

# 3️⃣ Cai dat thu vien
if (Test-Path "requirements.txt") { 
    Write-Host "📌 Dang cai dat cac thu vien tu requirements.txt..."
    pip install -r requirements.txt
} 
else { 
    Write-Host "⚠️ Khong tim thay file requirements.txt! Dang cai dat Flask..."
    pip install flask
}

# 4️⃣ Khoi tao database
Write-Host "🗄️ Khoi tao database..."
flask --app flaskr init-db

# 5️⃣ Chay server Flask
Write-Host "✅ Cai dat hoan tat! Dang khoi chay server..."
flask --app flaskr run --host=0.0.0.0 --port=5000
