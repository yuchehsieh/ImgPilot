# 使用 Python 基礎鏡像
FROM python:3.9-slim

# 安裝必要的系統庫
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

# 設置工作目錄
WORKDIR /app

# 安裝 Python 依賴
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製應用文件
COPY . .

# 暴露應用埠
EXPOSE 8080

# 啟動應用
CMD ["lep", "photon", "run", "-n", "imgpilot", "-m", "photon/main.py"]
