/*
	Đây là bài làm của mình về thực hành môn CSDL trường Đại học CNTT.
	Phần 1: Quản lý bán hàng
	Link đề: https://docs.google.com/document/d/1ZGSsQL831-IXAkRNjK6Mzy_PRhWbS-Pz/edit?usp=sharing&ouid=100087901892160415139&rtpof=true&sd=true
	LƯU Ý: Bài làm mình có tham khảo từ nhiều nguồn: bạn bè, thầy cô và cả những câu mình tự làm :<
	Link bài tham khảo: https://gist.github.com/uhpd/0432970077274701df9f
*/

CREATE DATABASE QLBH
GO

USE QLBH
GO 


/*---------------------------------------- PHẦN NHẬP LIỆU ------------------------------------------*/
CREATE TABLE KHACHHANG
( 
	MAKH CHAR(4) PRIMARY KEY,
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	DOANHSO MONEY,
	NGDK SMALLDATETIME
)

CREATE TABLE NHANVIEN
(
	MANV CHAR(4) PRIMARY KEY, 
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGAYVL SMALLDATETIME
)

CREATE TABLE SANPHAM
(
	MASP CHAR(4),
	TENSP VARCHAR(20),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY,
	CONSTRAINT PK_SANPHAM PRIMARY KEY (MASP)
)

CREATE TABLE HOADON
(
	SOHD INT PRIMARY KEY, 
	NGHD SMALLDATETIME,
	MAKH CHAR(4) FOREIGN KEY REFERENCES dbo.KHACHHANG(MAKH),
	MANV CHAR(4) FOREIGN KEY REFERENCES dbo.NHANVIEN(MANV),
	TRIGIA MONEY
)

CREATE TABLE CTHD 
(
	SOHD INT NOT NULL ,
	MASP CHAR(4) NOT NULL,
	SL INT,
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD, MASP),
	CONSTRAINT FK_CTHD_SOHD FOREIGN KEY(SOHD) REFERENCES dbo.HOADON(SOHD),
	CONSTRAINT FK_CTHD_MASP FOREIGN KEY(MASP) REFERENCES dbo.SANPHAM(MASP)
)

INSERT dbo.KHACHHANG
VALUES
(   'KH01',                    -- MAKH - char(4)
    'Nguyen Van A',                    -- HOTEN - varchar(40)
    '731 Tran Hung Dao, Q5, TpHCM',                    -- DCHI - varchar(50)
    '08823451',                    -- SODT - varchar(20)
    '19601022', -- NGSINH - smalldatetime
    13060000,                  -- DOANHSO - money
    '20060722'  -- NGDK - smalldatetime
    )

INSERT dbo.KHACHHANG
VALUES
(   'KH02',                    -- MAKH - char(4)
    'Tran Ngoc Han',                    -- HOTEN - varchar(40)
    '23/5 Nguyen Trai, Q5, TpHCM',                    -- DCHI - varchar(50)
    '0908256478',                    -- SODT - varchar(20)
    '19740403', -- NGSINH - smalldatetime
    280000,                  -- DOANHSO - money
    '20060730'  -- NGDK - smalldatetime
    )

INSERT dbo.KHACHHANG
VALUES
(   'KH03',                    -- MAKH - char(4)
    'Tran Ngoc Linh',                    -- HOTEN - varchar(40)
    '45 Nguyen Canh Chan, Q1, TpHCM',                    -- DCHI - varchar(50)
    '0938776266',                    -- SODT - varchar(20)
    '19800612', -- NGSINH - smalldatetime
    3860000,                  -- DOANHSO - money
    '20060805'  -- NGDK - smalldatetime
    )

INSERT dbo.KHACHHANG
VALUES
(   'KH04',                    -- MAKH - char(4)
    'Tran Minh Long',                    -- HOTEN - varchar(40)
    '50/34 Le Dai Hanh, Q10, TpHCM',                    -- DCHI - varchar(50)
    '0917325476',                    -- SODT - varchar(20)
    '19650309', -- NGSINH - smalldatetime
    250000,                  -- DOANHSO - money
    '20061002'  -- NGDK - smalldatetime
)

INSERT dbo.KHACHHANG
VALUES
(   'KH05',                    -- MAKH - char(4)
    'Le Nhat Minh',                    -- HOTEN - varchar(40)
    '34 Truong Dinh, Q3, TpHCM',                    -- DCHI - varchar(50)
    '08246108',                    -- SODT - varchar(20)
    '19500310', -- NGSINH - smalldatetime
    21000,                  -- DOANHSO - money
    '20061028'  -- NGDK - smalldatetime
)
INSERT dbo.KHACHHANG
VALUES
(   'KH06',                    -- MAKH - char(4)
    'Le Hoai Thuong',                    -- HOTEN - varchar(40)
    '227 Nguyen Van Cu, Q5, TpHCM',                    -- DCHI - varchar(50)
    '08631738',                    -- SODT - varchar(20)
    '19811231', -- NGSINH - smalldatetime
    915000,                  -- DOANHSO - money
    '20061124'  -- NGDK - smalldatetime
)
INSERT dbo.KHACHHANG
VALUES
(   'KH07',                    -- MAKH - char(4)
    'Nguyen Van Tam',                    -- HOTEN - varchar(40)
    '32/3 Tran Binh Trong, Q5, TpHCM',                    -- DCHI - varchar(50)
    '0916783565',                    -- SODT - varchar(20)
    '19710406', -- NGSINH - smalldatetime
    12500,                  -- DOANHSO - money
    '20061201'  -- NGDK - smalldatetime
)
INSERT dbo.KHACHHANG
VALUES
(   'KH08',                    -- MAKH - char(4)
    'Phan Thi Thanh',                    -- HOTEN - varchar(40)
    '45/2 An Duong Vuong, Q5, TpHCM',                    -- DCHI - varchar(50)
    '0938435756',                    -- SODT - varchar(20)
    '19710110', -- NGSINH - smalldatetime
    365000,                  -- DOANHSO - money
    '20061213'  -- NGDK - smalldatetime
)
INSERT dbo.KHACHHANG
VALUES
(   'KH09',                    -- MAKH - char(4)
    'Le Ha Vinh',                    -- HOTEN - varchar(40)
    '873 Le Hong Phong, Q5, TpHCM',                    -- DCHI - varchar(50)
    '08654763',                    -- SODT - varchar(20)
    '19790903', -- NGSINH - smalldatetime
    70000,                  -- DOANHSO - money
    '20070114'  -- NGDK - smalldatetime
)
INSERT dbo.KHACHHANG
VALUES
(   'KH10',                    -- MAKH - char(4)
    'Ha Duy Lap',                    -- HOTEN - varchar(40)
    '34/34B Nguyen Trai, Q1, TpHCM',                    -- DCHI - varchar(50)
    '08768904',                    -- SODT - varchar(20)
    '19830502', -- NGSINH - smalldatetime
    67500,                  -- DOANHSO - money
    '20070116'  -- NGDK - smalldatetime
)

INSERT dbo.SANPHAM VALUES(   'BC01', 'But chi', 'cay', 'Singapore', 3000)
INSERT dbo.SANPHAM VALUES(   'BC02', 'But chi', 'cay', 'Singapore', 5000)
INSERT dbo.SANPHAM VALUES(   'BC03', 'But chi', 'cay', 'Viet Nam', 3500)
INSERT dbo.SANPHAM VALUES(   'BC04', 'But chi', 'hop', 'Viet Nam', 30000)
INSERT dbo.SANPHAM VALUES(   'BB01', 'But bi', 'cay', 'Viet Nam', 5000)
INSERT dbo.SANPHAM VALUES(   'BB02', 'But bi', 'cay', 'Trung Quoc', 7000)
INSERT dbo.SANPHAM VALUES(   'BB03', 'But bi', 'hop', 'Thai Lan', 100000)
INSERT dbo.SANPHAM VALUES(   'TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500)
INSERT dbo.SANPHAM VALUES(   'TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500)
INSERT dbo.SANPHAM VALUES(   'TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000)
INSERT dbo.SANPHAM VALUES(   'TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500)
INSERT dbo.SANPHAM VALUES(   'TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000)
INSERT dbo.SANPHAM VALUES(   'TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000)
INSERT dbo.SANPHAM VALUES(   'TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000)
INSERT dbo.SANPHAM VALUES(   'ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000)
INSERT dbo.SANPHAM VALUES(   'ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000)
INSERT dbo.SANPHAM VALUES(   'ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000)
INSERT dbo.SANPHAM VALUES(   'ST04', 'So tay', 'quyen', 'Thai Lan', 55000)
INSERT dbo.SANPHAM VALUES(   'ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000)
INSERT dbo.SANPHAM VALUES(   'ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000)
INSERT dbo.SANPHAM VALUES(   'ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000)
INSERT dbo.SANPHAM VALUES(   'ST08', 'Bong ban', 'cai', 'Viet Nam', 1000)
INSERT dbo.SANPHAM VALUES(   'ST09', 'But long', 'cay', 'Viet Nam', 5000)
INSERT dbo.SANPHAM VALUES(   'ST10', 'But long', 'cay', 'Trung Quoc', 7000)

INSERT dbo.HOADON VALUES(   1001,'20060723','KH01','NV01', 320000 )
INSERT dbo.HOADON VALUES(   1002,'20060812','KH01','NV02', 840000 )
INSERT dbo.HOADON VALUES(   1003,'20060823','KH02','NV01', 100000 )
INSERT dbo.HOADON VALUES(   1004,'20060901','KH02','NV01', 180000 )
INSERT dbo.HOADON VALUES(   1005,'20061020','KH01','NV02', 3800000 )
INSERT dbo.HOADON VALUES(   1006,'20061016','KH01','NV03', 2430000 )
INSERT dbo.HOADON VALUES(   1007,'20061028','KH03','NV03', 510000 )
INSERT dbo.HOADON VALUES(   1008,'20061028','KH01','NV03', 440000 )
INSERT dbo.HOADON VALUES(   1009,'20061028','KH03','NV04', 200000 )
INSERT dbo.HOADON VALUES(   1010,'20061101','KH01','NV01', 5200000 )
INSERT dbo.HOADON VALUES(   1011,'20061104','KH04','NV03', 250000 )
INSERT dbo.HOADON VALUES(   1012,'20061130','KH05','NV03', 210000 )
INSERT dbo.HOADON VALUES(   1013,'20061212','KH06','NV01', 5000 )
INSERT dbo.HOADON VALUES(   1014,'20061231','KH03','NV02', 3150000 )
INSERT dbo.HOADON VALUES(   1015,'20070101','KH06','NV01', 910000 )
INSERT dbo.HOADON VALUES(   1016,'20070101','KH07','NV02', 12500 )
INSERT dbo.HOADON VALUES(   1017,'20070102','KH08','NV03', 35000 )
INSERT dbo.HOADON VALUES(   1018,'20070113','KH08','NV03', 330000 )
INSERT dbo.HOADON VALUES(   1019,'20070113','KH01','NV03', 30000 )
INSERT dbo.HOADON VALUES(   1020,'20070114','KH09','NV04', 70000 )
INSERT dbo.HOADON VALUES(   1021,'20070116','KH10','NV03', 67500 )
INSERT dbo.HOADON VALUES(   1022,'20070116',NULL,'NV03', 7000 )
INSERT dbo.HOADON VALUES(   1023,'20070117',NULL,'NV01', 330000 )

INSERT dbo.NHANVIEN VALUES
(   'NV01',                   -- MANV - char(4)
    'Nguyen Nhu Nhut',                   -- HOTEN - varchar(40)
    '0927345678',                   -- SODT - varchar(20)
    '20060413' -- NGAYVL - smalldatetime
)

INSERT dbo.NHANVIEN VALUES
(   'NV02',                   -- MANV - char(4)
    'Le Thi Phi Yen',                   -- HOTEN - varchar(40)
    '0987567390',                   -- SODT - varchar(20)
    '20060421' -- NGAYVL - smalldatetime
)

INSERT dbo.NHANVIEN VALUES
(   'NV03',                   -- MANV - char(4)
    'Nguyen Van B',                   -- HOTEN - varchar(40)
    '0997047382',                   -- SODT - varchar(20)
    '20060427' -- NGAYVL - smalldatetime
)

INSERT dbo.NHANVIEN VALUES
(   'NV04',                   -- MANV - char(4)
    'Ngo Thanh Tuan',                   -- HOTEN - varchar(40)
    '0913758498',                   -- SODT - varchar(20)
    '20060624' -- NGAYVL - smalldatetime
)
INSERT dbo.NHANVIEN VALUES
(   'NV05',                   -- MANV - char(4)
    'Nguyen Thi Truc Thanh',                   -- HOTEN - varchar(40)
    '0918590387',                   -- SODT - varchar(20)
    '20060720' -- NGAYVL - smalldatetime
)

INSERT dbo.CTHD VALUES( 1001, 'TV02', 10)
INSERT dbo.CTHD VALUES( 1001 , 'ST01', 5)
INSERT dbo.CTHD VALUES(1001, 'BC01', 5)
INSERT dbo.CTHD VALUES(1001, 'BC02', 10)
INSERT dbo.CTHD VALUES(1001, 'ST08', 10)
INSERT dbo.CTHD VALUES(1002, 'BC04', 20)
INSERT dbo.CTHD VALUES(1002, 'BB01', 20)
INSERT dbo.CTHD VALUES(1002, 'BB02', 20)
INSERT dbo.CTHD VALUES(1003, 'BB03', 10)
INSERT dbo.CTHD VALUES(1004, 'TV01', 20)
INSERT dbo.CTHD VALUES(1004, 'TV02', 10)
INSERT dbo.CTHD VALUES(1004, 'TV03', 10)
INSERT dbo.CTHD VALUES(1004, 'TV04', 10)
INSERT dbo.CTHD VALUES(1005, 'TV05', 50)
INSERT dbo.CTHD VALUES(1005, 'TV06', 50)
INSERT dbo.CTHD VALUES(1006, 'TV07', 20)
INSERT dbo.CTHD VALUES(1006, 'ST01', 30)
INSERT dbo.CTHD VALUES(1006, 'ST02', 10)
INSERT dbo.CTHD VALUES(1007, 'ST03', 10)
INSERT dbo.CTHD VALUES(1008, 'ST04', 8)
INSERT dbo.CTHD VALUES(1009, 'ST05', 10)
INSERT dbo.CTHD VALUES(1010, 'TV07', 50)
INSERT dbo.CTHD VALUES(1010, 'ST07', 50)
INSERT dbo.CTHD VALUES(1010, 'ST08', 100)
INSERT dbo.CTHD VALUES(1010, 'ST04', 50)
INSERT dbo.CTHD VALUES(1010, 'TV03', 100)
INSERT dbo.CTHD VALUES(1011, 'ST06', 50)
INSERT dbo.CTHD VALUES(1012, 'ST07', 3)
INSERT dbo.CTHD VALUES(1013, 'ST08', 5)
INSERT dbo.CTHD VALUES(1014, 'BC02', 80)
INSERT dbo.CTHD VALUES(1014, 'BB02', 100)
INSERT dbo.CTHD VALUES(1014, 'BC04', 60)
INSERT dbo.CTHD VALUES(1014, 'BB01', 50)
INSERT dbo.CTHD VALUES(1015, 'BB02', 30)
INSERT dbo.CTHD VALUES(1015, 'BB03', 7)
INSERT dbo.CTHD VALUES(1016, 'TV01', 5)
INSERT dbo.CTHD VALUES(1017, 'TV02', 1)
INSERT dbo.CTHD VALUES(1017, 'TV03', 1)
INSERT dbo.CTHD VALUES(1017, 'TV04', 5)
INSERT dbo.CTHD VALUES(1018, 'ST04', 6)
INSERT dbo.CTHD VALUES(1019, 'ST05', 1)
INSERT dbo.CTHD VALUES(1019, 'ST06', 2)
INSERT dbo.CTHD VALUES(1020, 'ST07', 10)
INSERT dbo.CTHD VALUES(1021, 'ST08', 5)
INSERT dbo.CTHD VALUES(1021, 'TV01', 7)
INSERT dbo.CTHD VALUES(1021, 'TV02', 10)
INSERT dbo.CTHD VALUES(1022, 'ST07', 1)
INSERT dbo.CTHD VALUES(1023, 'ST04', 6)



/*----------------------------------------PHẦN 1------------------------------------------*/

-- I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
-- 1.	Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.
-- 2.	Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE dbo.SANPHAM ADD GHICHU VARCHAR(20)

-- 3.	Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG
ALTER TABLE dbo.KHACHHANG ADD LOAIKH TINYINT

--4.	Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE dbo.SANPHAM ALTER COLUMN GHICHU VARCHAR(100)

--5.	Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE dbo.SANPHAM DROP COLUMN GHICHU

--6.	Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE dbo.KHACHHANG ALTER COLUMN LOAIKH VARCHAR(30)

--7.	Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE dbo.SANPHAM ADD CONSTRAINT CHECK_DVT CHECK (DVT IN('cay', 'hop','cai', 'quyen', 'chuc'))

--8.	Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE dbo.SANPHAM ADD CONSTRAINT CHECK_GIA CHECK (GIA >= 500)

--9.	Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE dbo.CTHD ADD CONSTRAINT check_sluong CHECK(SL >= 1)

-- 10.	Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE dbo.KHACHHANG ADD CONSTRAINT check_ngaydk CHECK( NGDK > NGSINH )

--11 -> 15 sẽ bổ sung sau!


/*----------------------------------------PHẦN 2------------------------------------------*/

--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--1.	Nhập dữ liệu cho các quan hệ trên. 

--2.	Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * INTO SANPHAM1 FROM dbo.SANPHAM
SELECT * INTO KHACHHANG1 FROM dbo.KHACHHANG

--3.	Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE dbo.SANPHAM1
SET GIA = GIA*1.05
WHERE NUOCSX = 'Thai Lan'

--4.	Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE dbo.SANPHAM1
SET GIA = GIA*0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10.000


--5.	Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên 
-- hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
USE QLBH
UPDATE dbo.KHACHHANG1
SET LOAIKH = 'Vip' 
WHERE NGDK < '20070101' AND DOANHSO >= 10000000
OR NGDK >'20070101' AND DOANHSO >=10000000



/*----------------------------------------PHẦN 3------------------------------------------*/

-- III. Ngôn ngữ truy vấn dữ liệu:
-- 1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

-- 2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE DVT IN ('cay', 'quyen')

--3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT * FROM dbo.SANPHAM 
WHERE MASP LIKE 'B%' AND MASP LIKE '%01'

--4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP,GIA FROM dbo.SANPHAM 
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000


-- 5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE ( NUOCSX = 'Thai Lan' OR NUOCSX = 'Trung Quoc' ) AND GIA BETWEEN 30000 AND 40000


-- 6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA FROM dbo.HOADON
WHERE NGHD BETWEEN '20070101' AND '20070102'

-- 7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA FROM dbo.HOADON
WHERE NGHD BETWEEN '20070101' AND '20070131' 
ORDER BY NGHD ASC, TRIGIA DESC


-- 8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT kh.MAKH, kh.HOTEN FROM dbo.KHACHHANG AS kh, dbo.HOADON AS hd
WHERE kh.MAKH = hd.MAKH AND hd.NGHD = '20070101'


--9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT hd.SOHD, hd.TRIGIA FROM dbo.HOADON AS hd, dbo.KHACHHANG AS kh
WHERE kh.HOTEN = 'Nguyen Van B' AND hd.NGHD = '20061028' AND kh.MAKH = hd.MAKH

--10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
USE QLBH
SELECT ct.MASP, sp.TENSP FROM dbo.HOADON hd
INNER JOIN dbo.KHACHHANG kh
ON kh.MAKH = hd.MAKH
INNER JOIN dbo.CTHD ct
ON hd.SOHD = ct.SOHD
INNER JOIN dbo.SANPHAM sp
ON sp.MASP = ct.MASP
WHERE kh.HOTEN = 'Nguyen Van A' AND hd.NGHD BETWEEN '20061001' AND '20061031'
GROUP BY ct.MASP, sp.TENSP

SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
AND EXISTS(SELECT *
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006 AND MAKH IN(SELECT H.MAKH
FROM HOADON H INNER JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE HOTEN = 'NGUYEN VAN A') AND S.MASP = C.MASP)
 
--11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT(SOHD) FROM CTHD
WHERE (MASP = 'BB01' OR MASP = 'BB02')

-- 12.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT(SOHD) FROM CTHD
WHERE (MASP = 'BB01' OR MASP = 'BB02') AND sl BETWEEN 10 AND 20

-- 13.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD
FROM CTHD A
WHERE A.MASP = 'BB01'
AND SL BETWEEN 10 AND 20
AND EXISTS(SELECT *
FROM CTHD B
WHERE B.MASP = 'BB02'
AND SL BETWEEN 10 AND 20
AND A.SOHD = B.SOHD)


-- 14.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT MASP,TENSP FROM dbo.SANPHAM 
WHERE NUOCSX = 'Trung Quoc'
AND MASP IN 
(SELECT ct.MASP FROM cthd AS ct
INNER JOIN dbo.SANPHAM
ON SANPHAM.MASP = ct.MASP
INNER JOIN dbo.HOADON AS hd
ON hd.SOHD = ct.SOHD
WHERE hd.NGHD = '20070101'
)

-- 15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE MASP NOT IN (
	SELECT MASP FROM dbo.CTHD
)
--16.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT MASP,TENSP FROM dbo.SANPHAM
WHERE MASP NOT IN(
	SELECT MASP FROM dbo.CTHD 
	INNER JOIN dbo.HOADON
	ON HOADON.SOHD = CTHD.SOHD
	WHERE YEAR(NGHD) = 2006
)

--17.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT MASP,TENSP FROM dbo.SANPHAM
WHERE MASP NOT IN(
	SELECT MASP FROM dbo.CTHD 
	INNER JOIN dbo.HOADON
	ON HOADON.SOHD = CTHD.SOHD
	WHERE YEAR(NGHD) = 2006
) AND NUOCSX =  'Trung Quoc'

-- 18.	Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT DISTINCT(SOHD) FROM dbo.CTHD ct, dbo.SANPHAM sp
WHERE ct.MASP = sp.MASP
AND sp.NUOCSX = 'Singapore'
GROUP BY (SOHD)
HAVING COUNT(DISTINCT(sp.MASP)) = (SELECT COUNT(*) FROM dbo.SANPHAM
								WHERE NUOCSX = 'Singapore')


-- 19.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
DECLARE @SoSPtutSING INT 
SET @SoSPtutSING = (SELECT COUNT(*) FROM dbo.SANPHAM WHERE NUOCSX = 'Singapore')


SELECT hd.SOHD FROM dbo.HOADON hd, dbo.CTHD ct, dbo.SANPHAM sp
WHERE YEAR(hd.NGHD) = 2006
AND ct.SOHD = hd.SOHD
AND sp.NUOCSX = 'Singapore'
AND ct.MASP = sp.MASP
GROUP BY (hd.SOHD)
HAVING COUNT(DISTINCT(sp.MASP)) >= @SoSPtutSING


--20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) FROM dbo.HOADON
where MAKH IS NULL

--21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT(MASP)) FROM dbo.HOADON hd
INNER JOIN CTHD 
ON CTHD.SOHD = hd.SOHD
WHERE YEAR(NGHD) = 2006

-- 22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MIN(TRIGIA) AS N'Giá hóa đơn thấp nhất', MAX(TRIGIA) AS N'Giá hóa đơn cao nhất' FROM dbo.HOADON

-- 23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS N'Giá trị hóa đơn trung bình 2006' FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006

-- 24.	Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS N'Tổng doanh thu bán hàng năm 2006' FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006

-- 25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD FROM dbo.HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM dbo.HOADON)
AND YEAR(nghd) = 2006


--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN FROM dbo.HOADON
INNER JOIN dbo.KHACHHANG
ON KHACHHANG.MAKH = HOADON.MAKH
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM dbo.HOADON)
AND YEAR(nghd) = 2006

--27.	In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
SELECT TOP 3 MAKH, HOTEN FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC

-- 28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA FROM dbo.SANPHAM 
				ORDER BY GIA DESC)


--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE NUOCSX = 'Thai Lan'
AND GIA IN (SELECT DISTINCT TOP 3 GIA FROM dbo.SANPHAM
			ORDER BY GIA DESC)

-- 30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE NUOCSX = 'Trung Quoc'
AND GIA IN (SELECT DISTINCT TOP 3 GIA FROM dbo.SANPHAM
			WHERE NUOCSX = 'Trung Quoc'
			ORDER BY GIA DESC)

-- 31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
SELECT TOP 3 MAKH, HOTEN FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC


--32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất. 
SELECT COUNT(*) FROM dbo.SANPHAM
WHERE NUOCSX = 'Trung Quoc'

--33.	Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(*) AS N'Tổng số sản phẩm' 
FROM dbo.SANPHAM
GROUP BY NUOCSX


--34 .	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT MAX(sp.GIA) AS N'Giá bán cao nhất', MIN(GIA) AS N'Giá bsn thấp nhất', AVG(GIA) AS N'Giá bán trung bình', sp.NUOCSX FROM dbo.SANPHAM sp 
GROUP BY sp.NUOCSX


--35. Tính doanh thu bán hàng mỗi ngày
SELECT NGHD, SUM(TRIGIA) AS 'Doanh Thu' FROM HOADON
GROUP BY NGHD

-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT ct.MASP, SUM(ct.SL) AS N'Tổng lượng sản phẩm' FROM dbo.HOADON hd, cthd ct 
WHERE hd.SOHD = ct.SOHD
AND MONTH(hd.NGHD) = 10 AND YEAR(hd.NGHD) = 2006
GROUP BY ct.MASP 
                
-- 37. Tính doanh thu bán hàng từng tháng trong năm 2006
SELECT MONTH(NGHD), SUM(TRIGIA) AS DOANHTHU FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)

--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
	--Cách 1
SELECT hd.SOHD FROM dbo.HOADON hd
WHERE (SELECT DISTINCT COUNT(ct.MASP) FROM dbo.CTHD ct
		WHERE ct.SOHD = hd.SOHD) >= 4
	--Cách 2
SELECT ct.SOHD FROM cthd ct
GROUP BY ct.SOHD
HAVING COUNT(*) >= 4

-- 39. Tìm hóa đơn có mua 3 sản phẩm do "Viet Nam" sản xuất(3 sản phẩm khác nhau)
	-- Mình đang tạm hiểu đề này là tìm số hóa đơn mua 3 loại sản phẩm do việt nam sản xuất
SELECT SOHD FROM dbo.CTHD
WHERE MASP IN ( SELECT MASP FROM dbo.SANPHAM
		WHERE NUOCSX = 'Viet Nam')
GROUP BY SOHD
HAVING COUNT(*) = 3

	-- Nếu đề là tìm số hóa đơn đã mua 3 sản phâm do việt nam sx
SELECT SOHD FROM dbo.CTHD
WHERE MASP IN (SELECT MASP FROM dbo.SANPHAM
		WHERE NUOCSX = 'Viet Nam')
GROUP BY SOHD
HAVING SUM(SL) = 3

-- 40.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
SELECT MAKH, HOTEN FROM dbo.KHACHHANG
WHERE MAKH = (SELECT TOP 1 MAKH 
			FROM HOADON hd
			GROUP BY MAKH
			ORDER BY COUNT(SOHD) DESC)

-- 41.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 MONTH(hd.NGHD) FROM hoadon hd
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(hd.NGHD)
ORDER BY SUM(hd.TRIGIA) DESC

-- 42.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT MASP, TENSP FROM dbo.SANPHAM
WHERE MASP = (
				SELECT TOP 1 MASP FROM HOADON hd, dbo.CTHD ct
				WHERE hd.SOHD = ct.SOHD
				AND YEAR(NGHD) = 2006
				GROUP BY MASP
				ORDER BY SUM(SL) DESC
			)

-- 43.	*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT sp.NUOCSX, MASP, TENSP FROM dbo.SANPHAM sp
WHERE EXISTS(
	SELECT sp1.NUOCSX, MAX(GIA) FROM dbo.SANPHAM sp1
	WHERE sp1.NUOCSX = sp.NUOCSX
	GROUP BY sp1.NUOCSX
	HAVING sp.GIA = MAX(GIA)
	)

-- 44.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT DISTINCT NUOCSX FROM SANPHAM sp
WHERE ( SELECT COUNT(DISTINCT sp1.GIA) FROM dbo.SANPHAM sp1
		WHERE sp1.NUOCSX = sp.NUOCSX) >= 3
	-- Ở đây mình không xét đến các mã sản phẩm khác nhau vì mình nghĩ Nếu giá của chúng khác nhau, thì loại sản phẩm đó ắt hẳn phải khác nhau

-- 45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
	-- Lấy ra top 10 khách hàng có doanh số cao nhất
SELECT TOP 10 MAKH FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC

	-- Lấy ra danh sách số lần mua của khách hàng theo thứ tự
SELECT MAKH, COUNT(SOHD) FROM dbo.HOADON
GROUP BY MAKH
ORDER BY COUNT(SOHD) DESC

	-- LEFT join 2 bảng đó lại với nhau
SELECT * FROM dbo.KHACHHANG
WHERE MAKH = (SELECT TOP 1 A.MAKH
				FROM 
				(SELECT TOP 10 MAKH FROM dbo.KHACHHANG
				ORDER BY DOANHSO DESC) AS A
				LEFT JOIN
				(SELECT MAKH, COUNT(SOHD) AS SL FROM dbo.HOADON
				GROUP BY MAKH) AS B
				ON B.MAKH = A.MAKH
				ORDER BY B.SL DESC
				)
