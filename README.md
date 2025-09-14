# مستندات تنظیم وب‌هوک بات روبیکا
# 📖 فهرست مطالب
معرفی

پیش‌نیازها

نصب و راه‌اندازی

استفاده

اجرا در Termux

عیب‌یابی

مثال�های کاربردی

# 🚀 معرفی
این اسکریپت برای تنظیم endpointهای بات روبیکا روی یک وب‌هوک مشخص طراحی شده است. با استفاده از این کد می‌توانید به سادگی تمام endpointهای لازم را روی سرور خود تنظیم کنید.
<br>
درضمن این پروژه چند نسخه برایوبهوک کردن داره برای مثال c++ یا پایتون یا node.js برای وبهوک کردن وجود دارد!

# 📋 پیش‌نیازها
برای نسخه پایتون:
```bash
pip install requests
```
برای نسخه C++:
```bash
sudo apt install curl g++
```
برای Termux:
```bash
pkg install curl python git
```
# 💻 نصب و راه‌اندازی
نسخه پایتون:
```bash
git clone https://github.com/Daniyel-Vanguard/Rubika_Webhook.git
cd rubika-webhook-setup
python webhook.py
```
نسخه C++:
```bash
git clone https://github.com/Daniyel-Vanguard/Rubika_Webhook.git
cd rubika-webhook-setup
g++ -o rubika_bot webhook.cpp -std=c++11
./webhook
```
# 🛠 استفاده
پیکربندی
قبل از اجرا، توکن بات و آدرس وب‌هوک را در کد تنظیم کنید:

``` python
# برای پایتون
token = "YOUR_BOT_TOKEN_HERE"
webhook_url = "https://yourdomain.com/bot.php"
cpp
// برای C++
const std::string token = "YOUR_BOT_TOKEN_HERE";
const std::string webhook_url = "https://yourdomain.com/bot.php";
endpointهای پشتیبانی شده
ReceiveUpdate - دریافت آپدیت‌ها

ReceiveInlineMessage - دریافت پیام‌های اینلاین

ReceiveQuery - دریافت کوئری‌ها

GetSelectionItem - دریافت آیتم‌های انتخابی

SearchSelectionItems - جستجوی آیتم‌های انتخابی
```

# 📱 اجرا در Termux
نصب پیش‌نیازها در Termux:
```bash
pkg update
pkg upgrade
pkg install python git curl
pip install requests
```
اجرای نسخه پایتون در Termux:
```bash
git clone https://github.com/Daniyel-Vanguard/Rubika_Webhook.git
cd rubika-webhook-setup
python webhook.py
```
یا اجرای نسخه C++ در Termux:
```bash
pkg install clang
git clone https://github.com/Daniyel-Vanguard/Rubika_Webhook.git
cd rubika-webhook-setup
g++ -o rubika_bot rubika_bot.cpp -std=c++11
./webhook
```
# 🔧 عیب‌یابی
خطاهای رایج:
Connection Error - مشکل اتصال به سرور

بررسی اتصال اینترنت

بررسی صحت آدرس وب‌هوک

Invalid Token - توکن نامعتبر

بررسی صحت توکن بات

اطمینان از فعال بودن بات

Timeout - timeout شدن درخواست

افزایش timeout در کد

بررسی سرعت اینترنت

لاگ‌گیری:
کد به طور خودکار نتیجه هر endpoint را نمایش می‌دهد.

# 📝 مثال‌های کاربردی

نمونه خروجی موفق:
```text
🚀 شروع تنظیم endpoint‌های بات Rubika

🌐 آدرس وبhook: https://yourdomain.com/bot.php
📡 ReceiveUpdate:
   ✅ موفق - وضعیت: OK
📡 ReceiveInlineMessage:
   ✅ موفق - وضعیت: OK
📡 ReceiveQuery:
   ✅ موفق - وضعیت: OK
📡 GetSelectionItem:
   ✅ موفق - وضعیت: OK
📡 SearchSelectionItems:
   ✅ موفق - وضعیت: OK

🎯 عملیات تکمیل شد!
```
اجرای خودکار:
می‌توانید اسکریپت را در crontab برای بررسی دوره‌ای تنظیم کنید.

# 🤝 مشارکت
Fork کنید

Branch ایجاد کنید (git checkout -b feature/AmazingFeature)

Commit کنید (git commit -m 'Add AmazingFeature')

Push کنید (git push origin feature/AmazingFeature)

Pull Request ایجاد کنید

# 📜 لایسنس
این پروژه تحت لایسنس MIT منتشر شده است.

# 📞 پشتیبانی
اگر مشکل یا سؤالی دارید:

Issue در GitHub ایجاد کنید

ایمیل: hadipishghadam13@gmail.com

⭐ اگر این پروژه برای شما مفید بود، لطفاً آن را در GitHub ستاره دهید!
