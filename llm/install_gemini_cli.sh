#!/bin/bash

echo "--- 正在啟動 Gemini CLI 及其前置環境安裝 ---"

# --- 步驟 1: 檢查並安裝 NVM (Node Version Manager) ---
echo "檢查並安裝 NVM (Node Version Manager)..."
NVM_INSTALL_SCRIPT="https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh"
if ! command -v nvm &> /dev/null; then
    echo "NVM 未安裝，正在下載並安裝 NVM..."
    if curl -o- "$NVM_INSTALL_SCRIPT" | bash; then
        echo "NVM 下載與安裝腳本已執行。"
    else
        echo "錯誤: 無法下載或執行 NVM 安裝腳本。請檢查網路連線或稍後再試。"
        exit 1
    fi
else
    echo "NVM 已安裝。"
fi

# 嘗試在當前 shell 中載入 NVM
echo "正在載入 NVM 到當前 shell 環境..."
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    . "$HOME/.nvm/nvm.sh"
    echo "NVM 已成功載入。"
else
    echo "警告: ~/.nvm/nvm.sh 不存在或為空。NVM 可能無法立即使用。"
    echo "您可能需要手動載入它: . '$HOME/.nvm/nvm.sh' 或重新啟動終端機。"
fi

# 再次檢查 NVM 是否可用
if ! command -v nvm &> /dev/null; then
    echo "錯誤: NVM 命令在載入後仍未找到。請確認 NVM 安裝正確並已載入。"
    echo "您可能需要重新啟動終端機或手動載入 NVM。"
    exit 1
else
    echo "NVM 已準備就緒: $(nvm --version)"
fi

# --- 步驟 2: 安裝 Node.js v22 及 npm ---
echo "正在安裝 Node.js v22 (及對應的 npm)..."
if nvm install 22; then
    echo "Node.js v22 已成功安裝。"
else
    echo "錯誤: 無法安裝 Node.js v22。請檢查 NVM 輸出訊息。"
    exit 1
fi

# 設定 Node.js v22 為預設版本
echo "正在設定 Node.js v22 為預設版本..."
nvm alias default 22 &> /dev/null
nvm use 22 &> /dev/null
echo "Node.js 版本設定完成。"

# 驗證 Node.js 和 npm 版本
echo "驗證 Node.js 和 npm 版本..."
NODE_VERSION=$(node -v)
NPM_VERSION=$(npm -v)
echo "Node.js 版本: $NODE_VERSION"
echo "npm 版本:     $NPM_VERSION"

if [[ "$NODE_VERSION" == v22.* ]]; then
    echo "Node.js 版本檢查: 通過 (預期 v22.x)"
else
    echo "警告: Node.js 版本不是 v22.x。當前版本: $NODE_VERSION"
fi

# --- 步驟 3: 安裝 Gemini CLI ---
echo "正在使用 npm 全域安裝 Gemini CLI..."
# 使用 sudo 以確保全域安裝權限
npm install -g @google/gemini-cli

if [ $? -eq 0 ]; then
    echo "Gemini CLI 安裝成功！"
else
    echo "錯誤: Gemini CLI 安裝失敗。請檢查上方輸出訊息。"
    exit 1
fi

# --- 步驟 4: 執行 Gemini CLI 初次設定 (主題與認證) ---
echo ""
echo "Gemini CLI 需要進行初次設定，包含選擇主題和 Google 帳戶認證。"
echo "現在將自動啟動 'gemini' 命令進行設定..."
gemini

echo ""
echo "--- 安裝流程已完成 ---"
echo "您現在可以在終端機中輸入 'gemini' 來啟動 Gemini CLI。"
echo "如果您需要設定 Gemini API Key (來自 Google AI Studio):"
echo "export GEMINI_API_KEY=\"您的API金鑰\""
echo "請將 '您的API金鑰' 替換為實際的 API 金鑰。"
echo ""
echo "如需查看更多命令，請在 Gemini CLI 中輸入 '/' 或 'gemini help'。"
echo "注意: 為了在新的終端機視窗中也能使用 'nvm' 和 'node'，請確保您的 shell 設定檔"
echo "(例如 ~/.bashrc, ~/.zshrc) 包含了 NVM 安裝腳本新增的載入行。"
