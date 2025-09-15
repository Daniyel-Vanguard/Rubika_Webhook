#!/bin/bash

TOKEN="JGHC0XREADYWPFQPKPAHYCBXOZHXSJNEVSVBNNZHTRVSZYIRHJINQZZWMCUJRWOA"
WEBHOOK_URL="https://vddaniyel.top/bot.php"
API_URL="https://botapi.rubika.ir/v3/${TOKEN}/updateBotEndpoints"


ENDPOINTS=(
    "ReceiveUpdate"
    "ReceiveInlineMessage" 
    "ReceiveQuery"
    "GetSelectionItem"
    "SearchSelectionItems"
)


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' 


show_help() {
    echo "استفاده: $0 [option]"
    echo "Options:"
    echo "  -h, --help     نمایش این راهنما"
    echo "  -t, --token    تنظیم توکن جدید"
    echo "  -w, --webhook  تنظیم آدرس وب‌هوک جدید"
    echo "  -q, --quiet    حالت بی‌صدا"
}


check_curl() {
    if ! command -v curl &> /dev/null; then
        echo -e "${RED}خطا: curl یافت نشد. لطفا نصب کنید:${NC}"
        echo "sudo apt install curl   # Ubuntu/Debian"
        echo "sudo yum install curl   # CentOS/RHEL"
        exit 1
    fi
}


send_request() {
    local endpoint=$1
    local json_data="{\"url\":\"$WEBHOOK_URL\",\"type\":\"$endpoint\"}"
    
    if [ "$QUIET" = false ]; then
        echo -e "${BLUE}📡 $endpoint:${NC}"
    fi
    

    response=$(curl -s -w "\n%{http_code}" \
        -X POST \
        -H "Content-Type: application/json" \
        -H "User-Agent: RubikaBot/1.0" \
        -d "$json_data" \
        --connect-timeout 30 \
        "$API_URL")
    
    http_code=$(echo "$response" | tail -n1)
    response_body=$(echo "$response" | sed '$d')
    
    if [ "$http_code" = "200" ]; then
        if echo "$response_body" | grep -q '"status":"OK"'; then
            if [ "$QUIET" = false ]; then
                echo -e "${GREEN}   ✅ موفق - وضعیت: OK${NC}"
            fi
            return 0
        else
            if [ "$QUIET" = false ]; then
                echo -e "${RED}   ❌ خطا - پاسخ: $response_body${NC}"
            fi
            return 1
        fi
    else
        if [ "$QUIET" = false ]; then
            echo -e "${RED}   ❌ خطای HTTP: $http_code${NC}"
        fi
        return 1
    fi
}


main() {

    check_curl
    

    if [ "$QUIET" = false ]; then
        echo -e "${YELLOW}🚀 شروع تنظیم endpoint‌های بات Rubika${NC}"
        echo -e "${YELLOW}==================================================${NC}"
        echo -e "${BLUE}🌐 آدرس وبhook: $WEBHOOK_URL${NC}"
        echo -e "${YELLOW}==================================================${NC}"
    fi
    

    for endpoint in "${ENDPOINTS[@]}"; do
        send_request "$endpoint"
        

        sleep 0.5
    done
    

    if [ "$QUIET" = false ]; then
        echo -e "${YELLOW}==================================================${NC}"
        echo -e "${GREEN}🎯 عملیات تکمیل شد!${NC}"
    fi
}


QUIET=false
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -t|--token)
            TOKEN="$2"
            API_URL="https://botapi.rubika.ir/v3/${TOKEN}/updateBotEndpoints"
            shift 2
            ;;
        -w|--webhook)
            WEBHOOK_URL="$2"
            shift 2
            ;;
        -q|--quiet)
            QUIET=true
            shift
            ;;
        *)
            echo -e "${RED}آرگومان ناشناخته: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

main