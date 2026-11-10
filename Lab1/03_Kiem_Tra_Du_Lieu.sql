-- ============================================================
-- 03_Kiem_Tra_Du_Lieu.sql
-- Truy vấn kiểm tra dữ liệu bảng dbo.history.
-- ============================================================

USE [LAB1_MaHoaCoDien];
GO

-- 20 bản ghi mới nhất
SELECT TOP (20)
    id, created_at, algorithm, operation, input_text, result_text
FROM dbo.history
ORDER BY id DESC;
GO

-- Tổng số bản ghi
SELECT COUNT(*) AS so_ban_ghi
FROM dbo.history;
GO

-- Thống kê theo thuật toán
SELECT algorithm,
       COUNT(*) AS so_lan
FROM dbo.history
GROUP BY algorithm
ORDER BY so_lan DESC;
GO
