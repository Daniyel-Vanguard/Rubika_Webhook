#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
#include <thread>
#include <chrono>

bool sendPostRequest(const std::string& url, const std::string& json_data, std::string& response) {

    std::string command = "curl -s -X POST ";
    command += "-H \"Content-Type: application/json\" ";
    command += "-H \"User-Agent: RubikaBot/1.0\" ";
    command += "-d '" + json_data + "' ";
    command += "--connect-timeout 30 ";
    command += "\"" + url + "\"";
    

    FILE* pipe = popen(command.c_str(), "r");
    if (!pipe) {
        return false;
    }
    
    char buffer[128];
    while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
        response += buffer;
    }
    
    return pclose(pipe) == 0;
}

int main() {
    const std::string token = "YOUR_BOT_TOKEN_HERE";
    const std::string webhook_url = "https://yourdomain.com/bot.php";
    const std::string api_url = "https://botapi.rubika.ir/v3/" + token + "/updateBotEndpoints";
    
    std::vector<std::string> endpoints = {
        "ReceiveUpdate",
        "ReceiveInlineMessage", 
        "ReceiveQuery",
        "GetSelectionItem",
        "SearchSelectionItems"
    };
    
    std::cout << "🚀 شروع تنظیم endpoint‌های بات Rubika" << std::endl;
    std::cout << "==================================================" << std::endl;
    std::cout << "🌐 آدرس وبhook: " << webhook_url << std::endl;
    std::cout << "==================================================" << std::endl;
    
    for (const auto& endpoint : endpoints) {
        std::string json_data = "{\"url\":\"" + webhook_url + "\",\"type\":\"" + endpoint + "\"}";
        std::string response;
        
        std::cout << "📡 " << endpoint << ":" << std::endl;
        
        try {
            if (sendPostRequest(api_url, json_data, response)) {
                if (response.find("\"status\":\"OK\"") != std::string::npos) {
                    std::cout << "   ✅ موفق - وضعیت: OK" << std::endl;
                } else {
                    std::cout << "   ❌ خطا - پاسخ: " << response << std::endl;
                }
            } else {
                std::cout << "   ❌ خطای شبکه در ارسال درخواست" << std::endl;
            }
        } catch (const std::exception& e) {
            std::cout << "   ❌ خطا: " << e.what() << std::endl;
        }
        
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }
    
    std::cout << "==================================================" << std::endl;
    std::cout << "🎯 عملیات تکمیل شد!" << std::endl;
    
    return 0;
}
