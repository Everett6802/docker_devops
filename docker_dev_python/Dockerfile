FROM python:3.11-slim

WORKDIR /app

# Create and activate Python virtual environment
ENV VENV_PATH=/opt/venv
RUN python3 -m venv $VENV_PATH
ENV PATH="$VENV_PATH/bin:$PATH"
# Install Python packages inside virtual environment
# xlrd is deprecated, reserve the xlrd and XlsxWriter packages temporarily for backward compability. Exploit the openpyxl package now
RUN pip install --upgrade pip \
    && pip install --no-cache-dir \
        pandas \
        yfinance \
        xlrd==1.2.0 \
        XlsxWriter \
        openpyxl \
        httpx  

# httpx 同時支援： sync（像 requests）和async（像aiohttp） API幾乎跟requests一樣 可寫「同一套 code 支援兩種模式」 較新、設計較現代
# aiohttp async 性能很好很成熟 但只能 async（沒有 sync）API 跟 requests 差很多 會維護兩套寫法

# 建立一個名為 super 的使用者，並建立主目錄
RUN useradd -ms /bin/bash super
# 改變 /app 的擁有者，讓 super 有存取權限
RUN chown -R super:super /app
#不建議在正式環境使用這樣的方式，除非是開發測試用途。 在安全導向的容器設計中，不應讓非 root user 能提權。
RUN echo "root:sp-admin.8" | chpasswd
# 預設仍使用 root（方便裝套件）
# 但你也可以最後加這行改成預設使用 super：
USER super

CMD ["python"]
