DEV_TARGET_RUNTIME=$3
CURRENT_PLATFORM="windows"
if [[ ($(uname) == "Linux") || ($(uname) == "Darwin") ]]; then
    CURRENT_PLATFORM=$(uname | awk '{print tolower($0)}')
fi

if [[ "$CURRENT_PLATFORM" == 'windows' ]]; then
    RUNTIME_ID='win-x64'
    if [[ "$PROCESSOR_ARCHITECTURE" == 'x86' ]]; then
        RUNTIME_ID='win-x86'
    fi
elif [[ "$CURRENT_PLATFORM" == 'linux' ]]; then
    RUNTIME_ID="linux-x64"
    if command -v uname > /dev/null; then
        CPU_NAME=$(uname -m)
        case $CPU_NAME in
            armv7l) RUNTIME_ID="linux-arm";;
            aarch64) RUNTIME_ID="linux-arm64";;
        esac
    fi
elif [[ "$CURRENT_PLATFORM" == 'darwin' ]]; then
    RUNTIME_ID='osx-x64'
fi

if [[ -n "$DEV_TARGET_RUNTIME" ]]; then
    RUNTIME_ID="$DEV_TARGET_RUNTIME"
fi

echo osx-x64