const axios = require('axios');

const TOKEN = "YOUR_BOT_TOKEN_HERE";
const WEBHOOK_URL = "https://yourdomain.com/bot.php";
const API_URL = `https://botapi.rubika.ir/v3/${TOKEN}/updateBotEndpoints`;

const ENDPOINTS = [
    "ReceiveUpdate",
    "ReceiveInlineMessage", 
    "ReceiveQuery",
    "GetSelectionItem",
    "SearchSelectionItems"
];

const headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'RubikaBot/1.0'
};

const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

async function setEndpoint(endpoint) {
    try {
        const data = {
            url: WEBHOOK_URL,
            type: endpoint
        };

        const response = await axios.post(API_URL, data, {
            headers: headers,
            timeout: 30000
        });

        return {
            success: true,
            data: response.data,
            endpoint: endpoint
        };
    } catch (error) {
        return {
            success: false,
            error: error.message,
            endpoint: endpoint
        };
    }
}

async function main() {
    console.log("🚀 شروع تنظیم endpoint‌های بات Rubika");
    console.log("=".repeat(50));
    console.log("🌐 آدرس وبhook:", WEBHOOK_URL);
    console.log("=".repeat(50));

    for (const endpoint of ENDPOINTS) {
        process.stdout.write(`📡 ${endpoint}: `);
        
        try {
            const result = await setEndpoint(endpoint);
            
            if (result.success) {
                if (result.data.status === 'OK') {
                    console.log("✅ موفق - وضعیت: OK");
                } else {
                    console.log("❌ خطا - پاسخ:", JSON.stringify(result.data));
                }
            } else {
                console.log("❌ خطا:", result.error);
            }
        } catch (error) {
            console.log("❌ خطای شبکه:", error.message);
        }

        await delay(500);
    }

    console.log("=".repeat(50));
    console.log("🎯 عملیات تکمیل شد!");
}

main().catch(console.error);
