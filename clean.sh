## 清除产物
find outputs -type f -delete

if [ $? -ne 0 ]; then
    echo "\033[41;37mFAILED to cd clean outputs !!\033[0m"
else
    echo "\033[42;35mSUCCEED to clean outputs !!\033[0m"
fi