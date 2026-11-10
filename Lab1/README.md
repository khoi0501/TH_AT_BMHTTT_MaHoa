# BÁO CÁO THỰC HÀNH LAB 1 : Mã Hóa Đối Xứng Cổ Điển


---

## 1. THÔNG TIN SINH VIÊN

- Họ và tên: Phạm Ngọc Anh Khôi
- Mã số sinh viên (MSSV): 1150070023
- Lớp: 11-TMĐT 
- Link Youtube: https://www.youtube.com/watch?v=VQyXalW1yYU

---

## 2. PHIÊN BẢN MÔI TRƯỜNG THỰC HIỆN

- Hệ điều hành: Windows 11 Pro 64-bit
- Java Development Kit (JDK): OpenJDK Temurin 17.0.21+9 (LTS) - openjdk version "17.0.21" 2026-10-20
- Môi trường phát triển (IDE): Apache NetBeans 31 (hỗ trợ Maven & Swing GUI Builder)
- Công cụ xây dựng (Build Tool): Apache Maven 3.x (cấu hình trong pom.xml, target Java release 17)
- Hệ quản trị cơ sở dữ liệu: Microsoft SQL Server 2019 (v15.0.2000.5), Instance: MSSQLSERVER, Cổng mạng: 1433
- Công cụ quản trị CSDL: SQL Server Management Studio 20 (SSMS 20)
- Thư viện kết nối CSDL (JDBC Driver): com.microsoft.sqlserver:mssql-jdbc:12.8.1.jre11

---

## 3. CÁC TÌNH HUỐNG ĐÃ THỰC HIỆN VÀ KẾT QUẢ

### 3.1. Kết quả kiểm thử 6 thuật toán mã hóa cổ điển cơ bản

1. Bài 1.1 - Thuật toán Caesar:
   - Bản rõ đầu vào: HELLO
   - Khóa: 3
   - Bản mã mong đợi: KHOOR
   - Kết quả thực tế: KHOOR
   - Đánh giá: Thành công, giải mã ngược lại ra chính xác HELLO.

2. Bài 1.2 - Thuật toán Vigenère:
   - Bản rõ đầu vào: HELLO
   - Khóa: KEY
   - Bản mã mong đợi: RIJVS
   - Kết quả thực tế: RIJVS
   - Đánh giá: Thành công, lặp khóa theo chu kỳ chính xác.

3. Bài 1.3 - Thuật toán Rail Fence (Mã ziczac):
   - Bản rõ đầu vào: HELLO WORLD
   - Khóa (Số hàng ray): 3
   - Bản mã mong đợi: HOREL OLLWD
   - Kết quả thực tế: HOREL OLLWD
   - Đánh giá: Thành công, sắp xếp zigzag và giải mã đúng vị trí.

4. Bài 1.4 - Thuật toán Playfair:
   - Bản rõ đầu vào: HELLOWORLD
   - Khóa: KEYWORD
   - Bản mã mong đợi: GYIZSCOKCFBU
   - Kết quả thực tế: GYIZSCOKCFBU
   - Đánh giá: Thành công, tạo ma trận 5x5 chuẩn, ghép cặp ký tự và đệm ký tự X đúng quy tắc.

5. Bài 1.5 - Thuật toán Transposition (Hoán vị cột):
   - Bản rõ đầu vào: BAOMAT
   - Khóa (Thứ tự cột): 2,3,1
   - Bản mã mong đợi: AAOTBM
   - Kết quả thực tế: AAOTBM
   - Đánh giá: Thành công, đọc cột theo đúng thứ tự hoán vị.

6. Bài 1.6 - Thuật toán Autokey:
   - Bản rõ đầu vào: HELLO
   - Khóa: KEY
   - Bản mã mong đợi: RIJSS
   - Kết quả thực tế: RIJSS
   - Đánh giá: Thành công, nối tiếp các chữ cái của bản rõ vào sau từ khóa để mở rộng dòng khóa.

---

### 3.2. Tình huống Nâng cao 01 - Form Tổng Hợp và Kết Nối SQL Server

- Thiết lập kết nối CSDL:
  + Cấu hình kết nối trên form: Server 127.0.0.1, Port 1433, CSDL LAB1_MaHoaCoDien, User lab1_user.
  + Bấm Test Connection: Ứng dụng kiểm tra và hiển thị kết nối thành công tới Microsoft SQL Server 15.00 qua giao thức TCP/IP.
  
- Tự động ghi log lịch sử (Audit Logging):
  + Khi người dùng thực hiện mã hóa hoặc giải mã bất kỳ thuật toán nào, ứng dụng tự động thực thi lệnh INSERT an toàn (dùng PreparedStatement) để lưu lịch sử vào bảng dbo.history.
  + Trạng thái form cập nhật thông báo xác nhận đã lưu thành công vào CSDL.
  
- Hiển thị và đối chiếu dữ liệu:
  + Bấm nút Xem lịch sử trên giao diện Java: Bảng JTable hiển thị đầy đủ danh sách các thao tác gồm ID, Thời gian, Thuật toán, Thao tác, Bản rõ và Bản mã.
  + Mở SSMS kiểm tra bảng dbo.history: Toàn bộ dữ liệu hiển thị trùng khớp 100% với trên ứng dụng Java.

---

### 3.3. Tình huống Nâng cao 02 - Phân Tích và Thám Mã Cổ Điển

- Tấn công vét cạn Caesar (Brute Force):
  + Bản mã đầu vào: KHOOR
  + Xử lý: Thử toàn bộ 26 trường hợp khóa từ k = 0 đến 25, tính toán điểm tần suất ngữ liệu tiếng Anh.
  + Kết quả: Xác định chính xác khóa k = 3 và khôi phục bản rõ là HELLO.

- Thống kê tần suất ký tự (Frequency Analysis):
  + Đếm và tính toán tỷ lệ phần trăm xuất hiện của từng chữ cái A-Z có trong bản mã, hỗ trợ phân tích giải mã thay thế đơn bảng.

- Tấn công bản rõ đã biết trên mã Vigenère (Known Plaintext Attack):
  + Đầu vào: Bản rõ biết trước HELLO, Bản mã thu được RIJVS.
  + Xử lý: Tính hiệu độ dịch chuyển giữa từng cặp ký tự tương ứng theo công thức Ki = (Ci - Pi) mod 26.
  + Kết quả: Khôi phục chính xác từ khóa bí mật ban đầu là KEY.

---

## 4. LỖI GẶP PHẢI VÀ CÁCH KHẮC PHỤC

1. Lỗi chứng chỉ SSL không tin cậy trên SSMS 20:
   - Hiện tượng: Khi đăng nhập bằng SSMS 20 xuất hiện lỗi "A connection was successfully established with the server, but then an error occurred during the login process. (provider: SSL Provider, error: 0 - The certificate chain was issued by an authority that is not trusted.)".
   - Nguyên nhân: Bản SSMS 20 mặc định bắt buộc mã hóa kết nối nghiêm ngặt, trong khi chứng chỉ SQL Server nội bộ là self-signed chưa được cài đặt tin cậy.
   - Cách khắc phục: Bấm vào mục Options trên cửa sổ kết nối SSMS và tích chọn ô "Trust server certificate". Trong chuỗi kết nối Java JDBC cũng thêm tham số trustServerCertificate=true.

2. Lỗi đăng nhập tài khoản SQL Server (Error 18456):
   - Hiện tượng: Đăng nhập bằng tài khoản lab1_user bị báo lỗi "Login failed for user 'lab1_user'. (Microsoft SQL Server, Error: 18456)".
   - Nguyên nhân: SQL Server sau khi cài đặt chỉ bật chế độ xác thực Windows Authentication Mode (LoginMode = 1), tài khoản SQL Server Authentication chưa được cho phép đăng nhập.
   - Cách khắc phục: Mở SSMS bằng Windows Authentication, click chuột phải vào Server chọn Properties, vào mục Security và chuyển sang chế độ "SQL Server and Windows Authentication mode" (Mixed Mode).

3. Lỗi mất kết nối đường ống Shared Memory (Error 233) và cổng TCP 1433 bị từ chối:
   - Hiện tượng: Kết nối báo lỗi "provider: Shared Memory Provider, error: 0 - No process is on the other end of the pipe. (Microsoft SQL Server, Error: 233)", đồng thời ứng dụng Java không thể kết nối tới 127.0.0.1:1433.
   - Nguyên nhân: Giao thức TCP/IP của SQL Server mặc định đang ở trạng thái Disabled, và dịch vụ SQL Server chưa được khởi động lại sau khi đổi cấu hình bảo mật.
   - Cách khắc phục: Mở SQLServerManager15.msc, vào mục Protocols for MSSQLSERVER và chọn Enable cho giao thức TCP/IP. Sau đó vào SQL Server Services, click chuột phải vào SQL Server (MSSQLSERVER) chọn Restart.

4. Lỗi lệnh java -version không nhận diện trong CMD:
   - Hiện tượng: Mở Command Prompt gõ java -version thì hệ thống báo lỗi không tìm thấy lệnh.
   - Nguyên nhân: Đường dẫn thư mục bin của bộ JDK mới cài đặt chưa được nạp vào biến môi trường Path của hệ thống.
   - Cách khắc phục: Thêm đường dẫn thư mục cài đặt D:\bin vào biến môi trường hệ thống Path (System Environment Variables), sau đó mở cửa sổ CMD mới kiểm tra lại sẽ nhận diện chính xác OpenJDK version 17.0.21.
