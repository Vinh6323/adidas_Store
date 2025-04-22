CREATE DATABASE QLY_WebBanHang
GO

USE QLY_WebBanHang
GO

/*
Created		26/03/2025
Modified		19/04/2025
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [SANPHAM]
(
	[MaSanPham] Integer NOT NULL,
	[TenSanPham] Nvarchar(255) NULL,
	[TrangThai] Bit NULL,
	[HinhAnh] Nvarchar(255) NULL,
	[Gia] Decimal(18,0) NULL,
	[GiaKhuyenMai] Decimal(18,0) NULL,
	[VAT] Float NULL,
	[SL_TonKho] Integer NULL,
	[MoTa] Nvarchar(255) NULL,
	[ChiTiet] Nvarchar(255) NULL,
	[NguoiTao] Integer NULL,
	[NgayTao] Datetime NULL,
	[NgayCapNhat] Datetime NULL,
	[NguoiCapNhat] Integer NULL,
	[MaDanhMuc] Integer NOT NULL,
Primary Key ([MaSanPham])
) 
go

Create table [KHACHHANG]
(
	[MaKhachHang] Integer NOT NULL,
	[TenKhachHang] Nvarchar(255) NULL,
	[GioiTinh] Bit NULL,
	[SDT] Char(10) NULL,
	[Email] Nvarchar(255) NULL,
	[DiaChi] Nvarchar(255) NULL,
Primary Key ([MaKhachHang])
) 
go

Create table [LIENHE]
(
	[MaLienHe] Integer NOT NULL,
	[TenLienHe] Nvarchar(255) NULL,
	[TrangThai] Bit NULL,
	[MaKhachHang] Integer NOT NULL,
Primary Key ([MaLienHe])
) 
go

Create table [DONDATHANG]
(
	[MaDatHang] Integer NOT NULL,
	[NgayDatHang] Datetime NULL,
	[TrangThai] Bit NULL,
	[TinhTrangGiaoHang] Nvarchar(255) NULL,
	[MaKhachHang] Integer NOT NULL,
Primary Key ([MaDatHang])
) 
go

Create table [HOADONDATHANG]
(
	[MaHoaDon] Integer NOT NULL,
	[GiamGia] Decimal(18,0) NULL,
	[NgayDuKienGiaoHang] Datetime NULL,
	[PhuongThucThanhToan] Bit NULL,
	[PhuongThucVanChuyen] Nvarchar(255) NULL,
	[MaDatHang] Integer NOT NULL,
	[MaSanPham] Integer NOT NULL,
Primary Key ([MaHoaDon])
) 
go

Create table [DANHMUCSANPHAM]
(
	[MaDanhMuc] Integer NOT NULL,
	[TenDanhMuc] Nvarchar(255) NULL,
	[TrangThai] Bit NULL,
	[SapXep] Integer NULL,
	[NgayTao] Datetime NULL,
	[NguoiTao] Integer NULL,
	[NgayCapNhat] Datetime NULL,
	[NguoiCapNhat] Integer NULL,
Primary Key ([MaDanhMuc])
) 
go

Create table [FEEDBACK]
(
	[MaFeedback] Integer NOT NULL,
	[TenKhachHang] Nvarchar(255) NULL,
	[Email] Nvarchar(255) NULL,
	[Sdt] Char(10) NULL,
	[ChiTiet] Nvarchar(255) NULL,
	[MaKhachHang] Integer NOT NULL,
Primary Key ([MaFeedback])
) 
go

Create table [DONNHAPHANG]
(
	[MaDonNhap] Integer NOT NULL,
	[TrangThai] Bit NULL,
	[NguoiTao] Integer NULL,
	[NguoiCapNhat] Integer NULL,
	[NgayTao] Datetime NULL,
	[NgayCapNhat] Datetime NULL,
Primary Key ([MaDonNhap])
) 
go

Create table [CHITIETDANHGIA]
(
	[MaDanhGia] Integer NOT NULL,
	[Ten] Nvarchar(255) NULL,
	[Email] Nvarchar(255) NULL,
	[SDT] Char(10) NULL,
	[ChiTietDanhGia] Nvarchar(255) NULL,
	[TrangThai] Bit NULL,
	[NgayDanhGia] Datetime NULL,
	[MaKhachHang] Integer NOT NULL,
	[MaSanPham] Integer NOT NULL,
Primary Key ([MaDanhGia],[MaKhachHang])
) 
go

Create table [CHITIETDONDATHANG]
(
	[MaDatHang] Integer NOT NULL,
	[MaSanPham] Integer NOT NULL,
	[TenSanPham] Nvarchar(255) NULL,
	[TongTien] Decimal(18,0) NULL,
	[SoLuong] Integer NULL,
Primary Key ([MaDatHang],[MaSanPham])
) 
go

Create table [CHITIETDONNHAPHANG]
(
	[MaSanPham] Integer NOT NULL,
	[MaDonNhap] Integer NOT NULL,
	[TenSanPham] Nvarchar(255) NULL,
	[SoLuong] Integer NULL,
	[DonGia] Decimal(18,0) NULL,
	[TongTien] Decimal(18,0) NULL,
Primary Key ([MaSanPham],[MaDonNhap])
) 
go

Alter table [CHITIETDONDATHANG] add  foreign key([MaSanPham]) references [SANPHAM] ([MaSanPham])  on update no action on delete no action 
go
Alter table [CHITIETDANHGIA] add  foreign key([MaSanPham]) references [SANPHAM] ([MaSanPham])  on update no action on delete no action 
go
Alter table [CHITIETDONNHAPHANG] add  foreign key([MaSanPham]) references [SANPHAM] ([MaSanPham])  on update no action on delete no action 
go
Alter table [DONDATHANG] add  foreign key([MaKhachHang]) references [KHACHHANG] ([MaKhachHang])  on update no action on delete no action 
go
Alter table [LIENHE] add  foreign key([MaKhachHang]) references [KHACHHANG] ([MaKhachHang])  on update no action on delete no action 
go
Alter table [FEEDBACK] add  foreign key([MaKhachHang]) references [KHACHHANG] ([MaKhachHang])  on update no action on delete no action 
go
Alter table [CHITIETDANHGIA] add  foreign key([MaKhachHang]) references [KHACHHANG] ([MaKhachHang])  on update no action on delete no action 
go
Alter table [CHITIETDONDATHANG] add  foreign key([MaDatHang]) references [DONDATHANG] ([MaDatHang])  on update no action on delete no action 
go
Alter table [SANPHAM] add  foreign key([MaDanhMuc]) references [DANHMUCSANPHAM] ([MaDanhMuc])  on update no action on delete no action 
go
Alter table [CHITIETDONNHAPHANG] add  foreign key([MaDonNhap]) references [DONNHAPHANG] ([MaDonNhap])  on update no action on delete no action 
go
Alter table [HOADONDATHANG] add  foreign key([MaDatHang],[MaSanPham]) references [CHITIETDONDATHANG] ([MaDatHang],[MaSanPham])  on update no action on delete no action 
go

Set quoted_identifier on
go

Set quoted_identifier off
go

INSERT INTO DANHMUCSANPHAM (MaDanhMuc, TenDanhMuc, TrangThai, SapXep, NgayTao, NguoiTao)
VALUES	(1001, 'Giày', 1, 1234, 19/04/2025, 001 ),
		(1002, 'Áo', 1, 1234, 19/04/2025, 001),
		(1003, 'Quần', 1, 1234, 19/04/2025, 001),
		(1004, 'Áo Khoác', 1, 1234, 19/04/2025, 001);

INSERT INTO SANPHAM (MaSanPham, TenSanPham, TrangThai, HinhAnh, Gia, GiaKhuyenMai, VAT, SL_TonKho, MoTa, ChiTiet, NguoiTao, MaDanhMuc)
VALUES	(20071, 'Áo Hyperglam WIN.RDY', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/e70c508f08f5450f8dd8fa08ed6b8a2a_9366/ao-gio-hyperglam-wind.rdy.jpg ', 2000000, 1950000, 2, 7, 'áo gió', 'áo khoác chất liệu dù thoải mái', 001, 1004),
		(20072, 'Áo Own The Run', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/baeac65bccf542f7bfef15d936fc784b_9366/ao-khoac-own-the-run.jpg ', 1800000, 1700000, 1, 4, 'áo khoác', 'áo khoác thời trang cực hot', 001, 1004),
		(20073, 'Áo Beyond', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c328d8c02594af385057d8a499dc608_9366/ao-hoodie-khoa-keo-doc-than-beyond.jpg ', 3300000, 3200000, 3, 5, 'áo hoodie', 'áo hoodie giữ ấm thời trang', 001, 1004),
		(20074, 'Áo Run It', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/b95707b453f74895b38b6b73c2c24b5e_9366/ao-khoac-run-it.jpg ', 1700000, 1650000, 1, 4, 'áo khoác', 'áo khoác chất liệu thoải mái', 001, 1004),
		(20075, 'Áo ADIZERO E JCKT', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/4a8bb903f0e340728410f57fe65c4cfc_9366/adizero-e-jckt.jpg ', 1700000, 1600000, 1, 7, 'áo khoác', 'áo khoác chất kiệu gió thoải mái', 001, 1004),
		(20076, 'Áo Harrington sọc nhỏ', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/3373c31aa493444aa44d7e1c23aa2db3_9366/ao-khoac-harrington-soc-nho.jpg ', 3600000, 3500000, 3, 7, 'áo khoác', 'áo khoác thời trang ra mắt tháng 3', 001, 1004),
		(20077, 'Áo Catch Jacket', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/6689c1c446b543a997be6440772e877c_9366/ao-khoac-coach-jacket-unisex.jpg ', 2600000, 2500000, 2, 6, 'áo khoác', 'áo khoác biểu tượng 3 lá', 001, 1003),
		(20078, 'Áo Trach 2 in 1 Denim', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/c391a977689142aaa433650c8af27a1d_9366/ao-track-top-2-trong-1-denim-adibreak.jpg ', 3100000, 300000, 3, 10, 'áo khoác', 'áo khoác 3 sọc đặc trưng', 001, 1004),
		(20079, 'Áo City Escape', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/d80e589dab8748b3a8dfb9acf42917c0_9366/ao-gio-det-thoi-city-escape.jpg ', 1920000, 1900000, 1, 7, 'áo gió', 'áo gió chất liệu vải thoi thoải mái', 001, 1004),
		(20080, 'Áo chần bông Go-To', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/e33936e055704b64b2eb3782a906aa19_9366/ao-khoac-chan-bong-go-to.jpg ', 2485000, 2300000, 2, 5, 'áo khoác', 'áo khoác lông cừu giữ ấm', 001, 1004),
		(20081, 'Áo CutOut Archiev', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/3dc94fd9803948fc8d8841f6b000651d_9366/ao-khoac-cutout-fashion-archive.jpg ', 2900000, 2800000, 2, 7, 'áo khoác ', 'áo khoác thoải mái đang hot tháng 4', 001, 1004),
		(20082, 'Áo gấp mũ Originals', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/81a3b47b297e4e86b612b40d4b540ea9_9366/ao-khoac-co-mu-gap-gon-originals.jpg ', 3800000, 3750000, 3, 5, 'áo khoác', 'áo khoác thiết kế bắt mắt hot tháng 1', 001, 1004),
		(20083, 'Áo Colorblcok Own The Run', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/d08a0d144da043868c9934ada2ddfe1b_9366/ao-khoac-colorblock-own-the-run.jpg ', 1800000, 1750000, 1, 6, 'áo khoác', 'áo khoác chạy bộ thiết kế thong thoáng', 001, 1004),
		(20084, 'Áo hai mặt tết', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/61722a678bb6493181cf92a26902fab5_9366/ao-khoac-hai-mat-tet.jpg ', 3800000, 3500000, 3, 7, 'áo khoác', 'áo khoác được thiết kế dịp tết dộc đáo', 001, 1004),
		(20085, 'Áo Nylon Wabash', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/49c0c28315214913b201e00a026c3436_9366/ao-khoac-coach-jacket-nylon-wabash.jpg ', 2900000, 2850000, 2, 4, 'áo khoác', 'áo khoác jacket đực thiết kế thời trang', 001, 1004),
		(20086, 'Áo EQT', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/54536ffc7c5d4f79aac90ad0fb85ab1c_9366/ao-gio-eqt.jpg ', 3500000, 3350000, 3, 9, 'áo khoác', 'áo khoác thiết kế độc đáo hot tháng 4', 001, 1004),
		(20087, 'Áo rằn ri Q1', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/2d9128fcba9140e9af31030f9cf594fe_9366/ao-khoac-ran-ri-q1.jpg ', 3100000, 3000000, 3, 7, 'áo khoác', 'áo khoác thời trang năng động', 001, 1004),
		(20088, 'Áo BILLINGE SPZL H', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/54d9faa9d3d54c0a9a00d93cfe9c0518_9366/billinge-spzl-h.jpg ', 3000000, 2900000, 2, 5, 'áo hoodie', 'áo hoodie thời trang tươi sáng', 001, 1004),
		(20089, 'Áo MER PW WB M', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a1d91adeb634b96bb715697a66c0d34_9366/mer-pw-wb-m.jpg ', 2400000, 2300000, 2, 4, 'áo hoodie', 'áo hoodie giữ ấm 2 lớp', 001, 1004),
		(20090, 'Áo One Basketball', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/ea2d902b7d7a4815b2e9acc8ba4b0c6b_9366/ao-hoodie-ni-one-basketball.jpg ', 2000000, 1900000, 1, 8, 'áo hoodie', 'áo hoodie co giãn thoải mái', 001, 1004); 

INSERT INTO SANPHAM (MaSanPham, TenSanPham, TrangThai, HinhAnh, Gia, GiaKhuyenMai, VAT, SL_TonKho, MoTa, ChiTiet, NguoiTao, MaDanhMuc)
VALUES	(20046, 'Quần Trach Pant SPRT', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/7136fed15cd64ee1abd5adde00785b43_9366/track-pants-adidas-sprt.jpg ', 1200000, 1150000, 1, 5, 'quần thể thao', 'quần thể thao thời trang năng động', 001, 1003),
		(20047, 'Quần Short Future Icons', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/9a935cbafa46422c80f5aef600c411fd_9366/quan-short-8-inch-logo-future-icons.jpg ', 600000, 595000, 1, 8, 'quần short', 'quần short năng động dễ di chuyển', 001, 1003),
		(20048, 'Quần 3 sọc Own The Run', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/0db2cc588b784477be9c0eeebf809311_9366/quan-3-soc-own-the-run.jpg ', 1500000, 1440000, 1, 9, 'quần short', 'quần short chạy bộ năng động', 001, 1003),
		(20049, 'Quần Tennis 3 sọc club', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/5dd73e4b448f4001b0a5ac8300572325_9366/quan-short-tennis-3-soc-club.jpg ', 780000, 765000, 1, 4, 'quần short', 'quần short tennis thể thao', 001, 1003),
		(20050, 'Quần thun da cá ALL SZN', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/16761818bf1d43349ac5af0900ec118a_9366/quan-short-vai-thun-da-ca-all-szn.jpg ', 840000, 800000, 1, 10, 'quần short', 'quần short năng dộng thoải mái', 001, 1003),
		(20051, 'Quần Parachute', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/23433d91b03c4596a5d4cc12924afa3e_9366/quan-parachute.jpg ', 1600000, 1500000, 1, 8, 'quần thời trang', 'quần thời trang thời thượng thiết kế đặc biệt', 001, 1003),
		(20052, 'Quần nì Lounge', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/d6081c0d783a40129306af650128e151_9366/quan-ni-lounge.jpg ', 1260000, 1100000, 1, 6, 'quần thể thao', 'quần thể thao thiết kế năng dộng', 001, 1003),
		(20053, 'Quần Legging 3 sọc Optime', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/1376d22a6fb64350b16d9d4783cf2bff_9366/quan-legging-dang-dai-3-soc-optime.jpg ', 980000, 950000, 1, 8, 'quần thể thao', 'quần thể thao thoải mái dùng để tập luyện', 001, 1003),
		(20054, 'Quần Short 2 in 1 tập gym', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/892e3320464243488e6d3ce6e88e4b36_9366/quan-short-2-trong-1-tap-gym.jpg ', 1040000, 1020000, 1, 5, 'quần short', 'quần short 2 trong 1 chuyên dụng tập gym', 001, 1003),
		(20055, 'Quần Track Pant Adicolor', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/4662575b1e1e439f86637e45bc3c4fa1_9366/quan-track-pant-sst-adicolor.jpg ', 1200000, 1100000, 1, 4, 'quần thể thao', 'quần thể thao thiết kế đặc sắc', 001, 1003),
		(20056, 'Quần thun da cá Essentials', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/869613e45fb74afca9d3ac6900a8540a_9366/quan-vai-thun-da-ca-logo-essentials.jpg ', 840000, 800000, 1, 10, 'quần thể thao', 'quần thể thao năng động thời trang', 001, 1003),
		(20057, 'Quần Designed 4 Gameday', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/55b978eee0974db68016af9e0049caa5_9366/quan-short-designed-4-gameday.jpg ', 960000, 900000, 1, 7, 'quần short', 'quần short thể thao hot vừa ra mắt', 001, 1003),
		(20058, 'Quần Ultimate 365', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/ed395074cf2a4afc9fd3916a49f080a3_9366/quan-short-golf-hoa-tiet-ultimate365.jpg ', 1680000, 1500000, 1, 8, 'quần short', 'quần short goft họa tiết đơn giản', 001, 1003),
		(20059, 'Quần Legging Hyperglam', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/f5079bef71484a5b99cdc611bf11f27b_9366/quan-legging-dang-dai-hyperglam.jpg ', 880000, 800000, 1, 9, 'quần thể thao', 'quần thể thao năng động thiết kế tồi giản', 001, 1003),
		(20060, 'Quần Legging Colorblock TECHFIT', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/721e0362e5e94d45aadabd69eff1a0ea_9366/quan-legging-7-8-colorblock-techfit.jpg ', 660000, 550000, 1, 9, 'quần thể thao', 'quần thể thao bán chạy tháng 1', 001, 1003),
		(20061, 'Quần Jogger', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/520a4bf6a79c42d8a1b3a0ecbb3d1301_9366/quan-jogger.jpg ', 1200000, 1100000, 1, 3, 'quần thời trang', 'quần thời trang đặc biệt bán chạy', 001, 1003),
		(20062, 'Quần Goft 5 túi Go-To', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/638ac5f58e0245d49a47f0144e3b0a6b_9366/quan-golf-5-tui-go-to.jpg ',1750000, 1700000, 2, 7, 'quần dài', 'quần dài goft thời trang', 001, 1003),
		(20063, 'Quần POLY SHORT', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/fb089128aa074c34bda3af470158b000_9366/poly-short.jpg ', 900000, 800000, 1, 8, 'quần short', 'quần short thời trang đăng hot tháng 3', 001, 1003),
		(20064, 'Quần 3 sọc train Essensials', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/5cc035c2c3b1448a834aafc30106ce0e_9366/quan-3-soc-train-essentials-aeroready.jpg ', 660000, 500000, 1, 7, 'quần thể thao', 'quần thể thao thời trang', 001, 1003),
		(20065, 'Quần Originals 70s', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/d3a2dcf738e646739cedf5783ba80933_9366/quan-track-pant-adidas-originals-70s.jpg ', 1680000, 1500000, 2, 12, 'quần thể thao', 'quần thể thao thời trang được thiết kế năng động', 001, 1003),
		(20066, 'Quần hemp Essentials+', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/986a6a53318f4d2bb783af25012380e5_9366/quan-short-made-with-hemp-essentials_.jpg ', 720000, 700000, 1, 7, 'quần short', 'quần short năng dộng thời trang', 001, 1003),
		(20067, 'Quần Badge of sport', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/538b988d19fd4709a34c7ce0b05b1810_9366/quan-badge-of-sport-future-icons.jpg ', 1440000, 1400000, 1, 5, 'quần thể thao', 'quần thể thao thời trang', 001, 1003),
		(20068, 'Quần Atlanta Stone', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b4c6ac7fe944c23a295dcb8e9152b90_9366/quan-track-pant-q4-atlanta-stone.jpg ', 1470000, 1300000, 1, 8, 'quần thời trang', 'quần thời trang hot vừa ra mắt tháng 3', 001, 1003),
		(20069, 'Quần Mouse Adidas x Diisney', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/eb9f841ae27c4fdfa6c735be7f63c7d9_9366/quan-short-legging-mouse-adidas-x-disney.jpg ', 680000, 650000, 1, 5, 'quần thể thao', 'quần thể thao legging thoải mái', 001, 1003),
		(20070, 'Quần HIIT Tailored', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/2541268433fc4404aabb8a23067d2804_9366/quan-legging-7-8-tap-luyen-hiit-tailored.jpg ', 1200000, 1000000, 1, 9, 'quần thể thao', 'quần thể thao năng dộng thoải mái', 001, 1003); 

INSERT INTO SANPHAM (MaSanPham, TenSanPham, TrangThai, HinhAnh, Gia, GiaKhuyenMai, VAT, SL_TonKho, MoTa, ChiTiet, NguoiTao, MaDanhMuc)
VALUES	(20021, 'Áo thun Asenal UBP', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/b223dbd4e0f34ee1b518e763a1225b48_9366/ao-thun-arsenal-ubp.jpg ', 1000000, 900000, 1, 3, 'áo bóng đá', 'áo bóng đá CLB Asenal mới', 001, 1002),
		(20022, 'Áo sân nhà Real Madrid', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/15842c1060dc4e12a9f9a272f8ac5ea0_9366/ao-dau-san-nha-real-madrid-24-25.jpg ', 2200000, 2000000, 2, 4, 'áo bóng đá', 'áo bóng đá CLB Real Madrid', 001, 1002),
		(20023, 'Áo JB TYRO JSY', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/94a9596c6cf84d10b6af24e939b46b42_9366/jb-tiro-jsy.jpg ', 800000, 700000, 1, 1, 'áo thun', 'áo thun được thiết kế thoải mái', 001, 1002),
		(20024, 'Áo sân nhà Manchester United', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/36288db412f944469a5623d47c634a6a_9366/ao-dau-san-nha-manchester-united-24-25.jpg ', 2200000, 2000000, 2, 3, 'áo bóng đá', 'áo bóng đá CLB Manchester United', 001, 1002),
		(20025, 'Áo sân khách Real Madrid', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/656b258d257f4911853ab990424b1889_9366/ao-dau-san-khach-real-madrid-24-25.jpg ', 22000000, 2000000,2, 2, 'áo bóng đá', 'áo bóng đá CLB Real Madrid', 001, 1002),
		(20026, 'Áo sân khách Manchester United', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/697b5d2215dd4e20adf96bdbfa01dcd2_9366/ao-dau-san-khach-manchester-united-24-25.jpg ', 2200000, 2000000, 2, 2, 'áo bóng đá', 'áo bóng đá CLB Manchester United', 001, 1002),
		(20027, 'Áo sân khách Asenal', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/606c7342fee74abc9525d7e815c4558a_9366/ao-dau-san-khach-arsenal-24-25.jpg ', 2200000, 2000000, 2, 3, 'áo bóng đá', 'áo bóng đá CLB Asenal', 001, 1002),
		(20028, 'Áo sân nhà Newcastle', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/ccb8a3dfbefc4ade9c44f676a8221a19_9366/ao-dau-san-nha-newcastle-united-fc-24-25.jpg ', 2200000, 2000000, 2, 1, 'áo bóng đá', 'áo bóng đá CLB Newcastle', 001, 1002),
		(20029, 'Áo sân nhà FC Bayern', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/8b51b538943d4e9dbde1930e5239c830_9366/ao-dau-san-nha-fc-bayern-24-25.jpg ', 2200000, 2000000, 2, 4, 'áo bóng đá', 'áo bóng đá CLB Bayern', 001, 1002),
		(20030, 'Áo sân nhà Juventus', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/59ad67c97d264bc084937ad2dec4b723_9366/ao-dau-san-nha-juventus-24-25.jpg ', 2200000, 2000000, 2, 6, 'áo bóng đá', 'áo bóng đá CLB Juventus', 001, 1002),
		(20031, 'Áo sân nhà Inter Miami', 1,'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/77ae70cac9154c7c80aeec00fa0b6331_9366/ao-dau-san-nha-inter-miami-cf-25-26.jpg ', 2200000, 2000000, 2, 7, 'áo bóng đá', 'áo bóng đá CLB Inter Miami', 001, 1002),
		(20032, 'Áo Tank Top Own The Run', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/1d8ae4f6811b4ef2b33bbe3f82de6c86_9366/ao-tank-top-own-the-run.jpg ', 750000, 700000, 1, 5, 'áo thun', 'áo thun Tank Top thoải mái', 001, 1002),
		(20033, 'Áo Polo Tenis Heritage', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/d01e17ef32df47339ee61c31fc2a4113_9366/a%CC%81o-thun-polo-tennis-adidas-heritage.jpg ', 1450000, 1300000, 1, 6, 'áo Polo', 'áo Polo hot thời trang', 001, 1002),
		(20034, 'Áo thun Own The Run', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/327d08bef4424f1995994e7ef476b253_9366/ao-thun-own-the-run.jpg ', 800000, 750000, 1, 4, 'áo thun', 'áo thun thời trang thoải mái', 001, 1002),
		(20035, 'Áo thun Tenis Heritage', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/337256b1175d49f493bc9dde6e202312_9366/ao-thun-tennis-adidas-heritage.jpg ', 1250000, 1100000, 1, 7, 'áo thun', 'áo thun Tenis thời trang', 001, 1002),
		(20036, 'Áo thun Fashion Cut Line', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/67a2c277d18648c2b89bb9dad73c0c09_9366/ao-thun-fashion-cut-line.jpg ', 1000000, 900000, 1, 5, 'áo thun', 'áo thun thời trang đơn giản', 001, 1002),
		(20037, 'Áo thun Graphics Summer', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/53a1e4f26e514389a164e7a52eaa61e2_9366/ao-thun-graphic-summer-of-sport.jpg ', 950000, 900000, 1, 7, 'áo thun', 'áo thun Summer thời trang', 001, 1002),
		(20038, 'Áo thun Graphic Q2', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/833e09b8c0a543caac506216d4f70c78_9366/ao-thun-graphic-q2.jpg ', 1200000, 1150000, 1, 8, 'áo thun', 'áo thun thiết kế đặc biệt', 001, 1002),
		(20039, 'Áo Polo S Sld W', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/3fe82c6557944fa789bec4b5f2131554_9366/s-sld-polo-w.jpg ', 1900000, 1850000, 1, 4, 'áo polo', 'áo polo được thiết kế trẻ trung năng động', 001, 1002),
		(20040, 'Áo Sơ mi Ripstop Essentials', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/e8aaa128a98749e686f917470b0197dc_9366/ao-so-mi-ngan-tay-ripstop-essentials.jpg ', 1300000, 1200000, 1, 4, 'áo sơ mi', 'áo sơ mi được thiết kế tối giản', 001, 1002),
		(20041, 'Áo thun Cutout Cali', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/fcf57f3255f740258dd146f085d94d1d_9366/ao-thun-cutout-cali.jpg ', 1100000, 1000000, 1, 5, 'áo thun', 'áo thun thương heiu65 được thiết kế đặc biệt', 001,  1002),
		(20042, 'Áo TankTop HyperGlam', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/224d3e3164f644929435d0fbde678662_9366/ao-tank-top-hyperglam-color-pop.jpg ', 900000, 800000, 1, 4, 'áo Tank Top', 'áo TankTop được thiết kế năng động', 001,  1002),
		(20043, 'Áo Campus 2000', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/f2c3d9e26b23470fb6ba0df50246591b_9366/campus2000-tee.jpg ', 900000, 850000, 1, 6, 'áo thun', 'áo thun được thiết kế đơnb giản thương hiệu', 001, 1002),
		(20044, 'Áo thun Neuclassic', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/46c2bcdee0074709a6c3fc4e26fbda0b_9366/ao-thun-neuclassics.jpg ', 950000, 900000, 1, 8, 'áo thun', 'áo thun đặc biết 3 sọc', 001, 1002),
		(20045, 'Áo thun Jabbar Skyhook', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/fb5f768387c741fa823f9c886f369c3c_9366/ao-thun-jabbar-skyhook.jpg ', 1200000, 1100000, 1, 10, 'áo thun', 'áo thun hot vừa ra mắt tháng 1', 001, 1002);

INSERT INTO SANPHAM (MaSanPham, TenSanPham, TrangThai, HinhAnh, Gia, GiaKhuyenMai, VAT, SL_TonKho, MoTa, ChiTiet, NguoiTao, NgayTao, MaDanhMuc)
VALUES	(2001, 'Giày Samba OG', 1, ' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/7f4ea36f59b343d68b87a5fb29c3bdc5_9366/giay-samba-og.jpg ', 2700000, 2500000, 2, 5, 'Giày thể thao', 'giày của adidas vừa được ra mắt cực kỳ hot đang được giảm giá sốc', 001, 2025/04/01, 1001),
		(2002, 'Giày Tenis GameCourt 2.0', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/54f090b74bdf4b26b59ab96bc6962f72_9366/giay-tennis-gamecourt-2.0.jpg ', 2000.000, 1850.000, 2, 3, 'Giày thể thao', 'Giày Tenis được thiết kế đặc biệt thời trang', 001, 2025/04/01, 1001),
		(2003, 'Giày LightBlaze Moc', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/e045faff1dcb4bedaaf45a89e189ca80_9366/giay-lightblaze-moc.jpg ', 1500000, 1000000, 2, 2, 'Giày chạy bộ', 'giày chạy bộ được thiết kế thời trang', 001, 2025/04/01, 1001),
		(2004, 'Giày formGround F50', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/5d705cc8d7bf48cb8a9a19b82620966f_9366/giay-da-bong-firm-ground-f50-elite.jpg ', 5800000, 5700000, 5, 4, 'Giày đá bóng', 'giày đá bóng được thiết kế đặc biệt', 001, 2025/04/01, 1001),
		(2005, 'Giày Gazelle Indoor', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/2ee4bcf9620c462f99e2cb114b785d43_9366/giay-gazelle-indoor.jpg ', 3600000, 3400000, 3, 3, 'giày thể thao', 'giày thể thao hot vừa được ra mắt', 001, 2025/04/01, 1001),
		(2006, 'Giày Multi_Ground F50', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/f2274c72c76245b59acc6428d4f46fa7_9366/giay-da-bong-firm-multi-ground-f50-league.jpg ', 2400000, 2200000, 2, 5, 'giày đá bóng', 'giày đá bóng được thiết kế đinh đặc biệt', 001, 2025/04/01, 1001),
		(2007, 'Galaxy 7', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/995f7ebc3f7842f5b0345f8674c38783_9366/giay-chay-bo-galaxy-7.jpg ', 1800000, 1690000, 1, 3, 'Giày chạy bộ', 'giày chạy bộ được thiết kế thoải mái', 001, 2025/04/01, 1001),
		(2008, 'Giày Turf F5 Pro', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/301268d602d74202bd75fa4f3a174978_9366/giay-da-bong-turf-f50-pro.jpg ', 3500000, 3300000, 3, 3, 'giày bóng đá', 'giày bóng đá chuyên nghiệp', 001, 2025/04/01, 1001),
		(2009, 'Giày Ultrarun 5', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/728370f703de4678b2facf337c35d1f5_9366/giay-chay-bo-ultrarun-5.jpg ', 2200000, 2000000, 2, 3, 'giày chạy bộ', 'giày chạy bộ thoải mái cho người dùng', 001, 2025/04/01, 1001),
		(20010, 'Giày Campus 00s', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/51525e74b9cb4146aeb2d6cf421b2f96_9366/giay-campus-00s-beta.jpg ', 2600000, 2500000, 2, 3, 'giày thể thao', 'giày thể thao thiết kế thời trang năng động', 001, 2025/04/01, 1001),
		(20011, 'Giày Adizero Aruku', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/26debca211f24d72b8e20d25de5d607a_9366/Giay_Adizero_Aruku_DJen_JH7772_02_standard_hover.jpg ', 3100000, 2900000, 2, 4, 'giày thể thao', 'giày thể thao được thiết kế năng dộng thoải mái', 001, 2025/04/01, 1001),
		(20012, 'Giày Ultraboost 1.0', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/77897d7192a24b3ea64b5f6ce5b4049f_9366/giay-ultraboost-1.0.jpg ', 4500000, 4350000, 4, 4, 'giày chạy bộ', 'giày chạy bộ thởi trang cá tính', 001, 2025/04/01, 1001),
		(20013, 'Giày Adi Racer Lo', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/2ab4209e078544a29393abcf619e3170_9366/Giay_Adi_Racer_Lo_trang_JH8736_02_standard_hover.jpg ', 2900000, 2800000, 2, 5, 'giày thể thao', 'giày thể thao adidas màu sắc tươi sáng', 001, 2025/04/01, 1001),
		(20014, 'Giày Harden Volum 9', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/241041456b6e40feb12a618025d96a5a_9366/giay-harden-volume-9.jpg ', 3900000, 3800000, 3, 1, 'giày thể thao', 'giày thể thao được thiết kế đặc sắc', 001, 2025/04/01, 1001),
		(20015, 'Giày Sl 72 RS', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/fd1f11ff66364cbd8497d95b6d178144_9366/giay-sl-72-rs.jpg ', 2400000, 2300000, 2, 2, 'giày thể thao', 'giày th6e3 thao cực hot ra mắt tháng 2', 001, 2025/04/01, 1001),
		(20016, 'Giày Raidmove ADV 2', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/2321083f918b431b9849ec5e3b7372d1_9366/giay-rapidmove-adv-2.jpg ', 3200.000, 3000000, 3, 3, 'giày thể thao', 'giày thể thao dược thiết kết chuyên dụng tập gym', 001, 2025/04/01, 1001),
		(20017, 'Giày UltraDream DNA', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/9f0af2f7723541ef8567bc90374f967e_9366/giay-ultradream-dna.jpg ', 2400000, 2000000, 2, 1, 'giày thể thao', 'giày thể thao hot được ra mắt tháng 2', 001, 2025/04/01, 1001),
		(20018, 'Giày Court', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/4ea3241d0cf2451684fa91615d47871a_9366/giay-court.jpg ', 600000, 500000, 1, 3, 'giày thể thao', 'giày thể thao hot đang bán chạy', 001, 2025/04/01, 1001),
		(20019, 'Giày SSTR V Bape', 1,' https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/cc0dd5174caa4f0abd2004191e227aa2_9366/giay-sstr-v-bape.jpg ', 3300000, 3000000, 3, 2, 'giày thể thao', 'giày thể thao vừa được ra mắt tháng 3', 001, 2025/04/01, 1001),
		(20020, 'Giày PamPanga FPZL', 1,'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/0c782a8538bd45408d6ffe7768a4e851_9366/pampanga-spzl.jpg ', 3000000, 2500000, 2, 2, 'giày thể thao', 'giày thể thao được thiết kế độc đáo', 001, 2025/04/01, 1001);

