import requests
import json
import time

token = "JGHC0XREADYWPFQPKPAHYCBXOZHXSJNEVSVBNNZHTRVSZYIRHJINQZZWMCUJRWOA"
webhook_url = "https://vddaniyel.top/bot.php"
api_url = f"https://botapi.rubika.ir/v3/{token}/updateBotEndpoints"


endpoints = [
    "ReceiveUpdate",
    "ReceiveInlineMessage", 
    "ReceiveQuery",
    "GetSelectionItem",
    "SearchSelectionItems"
]

headers = {
    "Content-Type": "application/json",
    "User-Agent": "RubikaBot/1.0"
}

print("🚀 شروع تنظیم endpoint‌های بات Rubika")
print("=" * 50)
print(f"🌐 آدرس وبhook: {webhook_url}")
print("=" * 50)


for endpoint in endpoints:
    data = {
        "url": webhook_url,
        "type": endpoint
    }
    
    try:
        response = requests.post(api_url, json=data, headers=headers, timeout=30)
        result = response.json()
        
        print(f"📡 {endpoint}:")
        if result.get('status') == 'OK':
            print(f"   ✅ موفق - وضعیت: {result.get('data', {}).get('status', 'Unknown')}")
        else:
            print(f"   ❌ خطا - پاسخ: {result}")
            
    except Exception as e:
        print(f"📡 {endpoint}:")
        print(f"   ❌ خطای شبکه: {e}")
    
    time.sleep(0.5)  

print("=" * 50)
print("🎯 عملیات تکمیل شد!")
