create database QuanLiDienThoai
create table LOAI
(
	MaLoai int identity(1,1) primary key,
	TenLoai nvarchar(50)
)
create table KhachHang
(
	[MaKH] [int] IDENTITY(1,1) primary key,
	[HoTen] [nvarchar](50),
	[NgaySinh] [datetime],
	[GioiTinh] [nvarchar](3),
	[DienThoai] [varchar](50), 
	[TaiKhoan] [varchar](50),
	[MatKhau] [nvarchar](50),
	[Email] [nvarchar](50), 
	[DiaChi] [nvarchar](50), 
)
create table NhaCungCap
(
	[MaNCC] [int] IDENTITY(1,1) NOT NULL primary key,
	[TenNCC] [nvarchar](50),
	[DiaChi] [nvarchar](50),
	[DienThoai] [varchar](50), 
)
create table DienThoai
(
	[MaDT] [int] IDENTITY(1,1) NOT NULL primary key,
	[TenDT] [nvarchar](100),
	[GiaBan] [money] ,
	[MoTa] [nvarchar](max) NULL,
	[ManHinh] [nvarchar](100) NULL,
	[HeDieuHanh] [nvarchar](100) NULL,
	[CameraSau] [nvarchar](100) NULL,
	[CameraTruoc] [nvarchar](100) NULL,
	[CPU] [nvarchar](100) NULL,
	[RAM] [nvarchar](100) NULL,
	[BoNhoTrong] [nvarchar](100) NULL,
	[TheSim] [nvarchar](100) NULL,
	[DungLuongPin] [nvarchar](100) NULL,
	[NgayCapNhat] [datetime],
	[Anh] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[Moi] [int],
	constraint fk_dt_l foreign key(MaLoai) references LOAI(MaLoai),
	constraint fk_dt_ncc foreign key(MaNCC) references NhaCungCap(MaNCC)
)
create table DonHang
(
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL primary key,
	[NgayGiao] [datetime] NULL,
	[NgayDat] [datetime] NULL,
	[DaThanhToan] [nvarchar](50) NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[MaKH] [int] NULL,
	constraint fk_dh_kh foreign key(MaKH) references KhachHang(MaKH)
)
create table ChiTietDonHang
(
	[MaDonHang] [int] NOT NULL primary key,
	[MaDT] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL
	constraint fk_ctdh_dt foreign key(MaDT) references DienThoai(MaDT)
)
insert into LOAI
values
( N'IPHONE'),
( N'SAMSUNG'),
( N'OPPO'),
( N'XIAOMI'),
( N'VIVO'),
( N'REALME'),
( N'NOKIA'),
( N'HUAWEI'),
( N'Mobell'),
( N'VSMART')
set dateformat dmy
insert into KhachHang
values
(N'Mai Quốc Đạt','4/10/2000', N'Nam', '0987867821', N'kaiser', N'410', N'datkaiser@gamil.com', N'HUE'),
(N'Lê Nguyễn Long Quốc An','13/2/2000', N'Nam', '0987867822', N'AnLe', N'1302', N'An@gamil.com', N'LA'),
(N'Hoàng Minh Nhật','8/3/2000', N'Nam', '0987867221', N'nhattt', N'nhattt', N'Nhat@gamil.com', N'Gia Lai'),
(N'Huỳnh Thanh Phương','14/10/2000', N'Nam', '0987867821', N'HTP', N'PTH', N'Phuog@gamil.com', N'LA'),
(N'Nguyễn Thị Hà Phương','31/12/2000', N'Nữ', '0987867821', N'hafphuowng', N'3112', N'datkaiser@gamil.com', N'HUE')

insert into NhaCungCap
values
(N'NHẬT CƯỜNG MB', N'TÂN BÌNH', N'1900156045'),
(N'TÍN PHONG', N'Biên Hòa-Đồng Nai', N'1900151112'),
( N'Kim đồng', N'Tp.HCM', N'1900157090'),
( N'QUANG TRUNG', N'Tp.HCM', N'0908419981'),
( N'TRẦN PHÁT', N'Đà Nẵng', N'0903118833'),
( N'AMAZING', N'Bình Dương', N'0913336677'),
( N'GUDJOB', N'Tp.HCM', N'0989888888'),
( N'Khoa Học & Kỹ Thuật', N'Hà Nội', N'0903118824'),
( N'Thanh Niên', N'Tp.HCM', N'0903118811'),
( N'Tài Chính', N'Huế', N'0903118833')
set dateformat dmy
insert into DienThoai
values
( N'Điện thoại OPPO Find X2', '19990000', N'Tiếp nối thành công vang dội của thế hệ Find X, OPPO chính thức ra mắt Find X2 với những đường nét thanh lịch từ thiết kế phần cứng cho đến trải nghiệm phần mềm, hứa hẹn một vẻ đẹp hoàn hảo, một sức mạnh xứng tầm',N'AMOLED, 6.78", Quad HD+ (2K+)',N'Android 10',N'Chính 48 MP & Phụ 13 MP, 12 MP',N'32 MP',N'Snapdragon 865 8 nhân',N'12 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 5G',N'4200 mAh có sạc nhanh' ,'12/12/2020', N'oppo-find-x2a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO Reno4 Pro', '11990000', N' Mới đây, OPPO đã chính thức trình làng chiếc smartphone mới mang tên OPPO Reno4 Pro',N'AMOLED, 6.5", Full HD+',N'Android 10',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'32 MP',N'Snapdragon 720G 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4000 mAh có sạc nhanh' ,'12/12/2020', N'oppo-reno4a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO Reno3', '6990000', N'OPPO Reno3 là một sản phẩm ở phân khúc điện thoại tầm trung nhưng vẫn sở hữu cho mình ngoại hình bắt mắt, cụm camera chất lượng và cùng nhiều đột phá về màn hình cũng như hiệu năng.',N'AMOLED, 6.4", Full HD+',N'Android 10',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'44 MP',N'MediaTek Helio P90 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4025 mAh có sạc nhanh' ,'12/12/2020', N'oppo-reno3a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO A93', '7990000', N' Tháng 9/2020, OPPO tiếp tục cho ra mắt dòng sản phẩm thuộc phân khúc điện thoại tầm trung được xem là tiếp nối từ OPPO A92 với nhiều điểm được nâng cấp như hiệu năng, hệ thống camera cùng khả năng sạc nhanh 18W với tên gọi OPPO A93',N'	AMOLED, 6.43", Full HD+',N'Android 10',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'32 MP',N'Snapdragon 720G 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4000 mAh có sạc nhanh' ,'12/12/2020', N'oppo-a93a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO A15', '3990000', N'OPPO hãng điện thoại luôn được người Việt tin dùng và lựa chọn, mới đây hãng đã cho ra mắt mẫu OPPO A15 có thiết kế đẹp, cấu hình đủ dùng',N'IPS LCD, 6.52", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4230 mAh, Không' ,'12/12/2020', N'oppo-a15a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO A12 (3GB/32GB)', '2990000', N'OPPO A12 là chiếc điện thoại phổ thông rất đáng mua từ nhà OPPO. Những điểm đáng tiền phải kể đến trên thiết bị này bao gồm thiết kế đẹp với màn hình giọt nước, hiệu năng mượt mà và thời lượng pin dùng thoải mái',N'IPS LCD, 6.22", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4230 mAh, Không' ,'12/12/2020', N'oppo-a12a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO A31 (6GB/128GB)', '4790000', N'OPPO A31 2020 (6GB/128GB) - Smartphone gây ấn tượng với bộ 3 camera sau trứ danh OPPO, hiệu năng tốt kết hợp nhiều nâng cấp đáng kể về thiết kế trên giá thành phải chăng phù hợp với đại đa số người dùng',N'IPS LCD, 6.22", HD+',N'Android 9 (Pie)',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4230 mAh, Không' ,'12/12/2020', N'oppo-a31a.png', 100, 3, 3, 1),
( N'Điện thoại OPPO A53 (2020)', '4490000', N'OPPO A53 2020 là mẫu smartphone tầm trung vừa mới được OPPO cho ra mắt, gây ấn tượng với thiết kế màn hình đục lỗ tràn viền 90Hz, chip Snapdragon 460 mới nhất cùng cụm 3 camera ấn tượng, được bán với mức giá vô cùng phải chăng',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'5000 mAh, có sạc nhanh' ,'12/12/2020', N'oppo-a53a.png', 100, 3, 3, 1),
( N'Điện thoại Vivo Y12s (3GB/32GB)', '3290000', N'Vivo Y12s, chiếc điện thoại đến từ nhà sản xuất Vivo, sở hữu một mức giá tầm trung, hiệu năng mạnh mẽ cùng viên pin dung lượng khủng giúp bạn tha hồ trải nghiệm giải trí, chơi game suốt ngày dài',N'IPS LCD, 6.51", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'5000 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-y12sa.png', 100, 5, 5, 1),
( N'Điện thoại Vivo X50 Pro', '17990000', N'Vivo vừa mang tới một "làn gió mới" mang tên Vivo X50 Pro nổi bật với hệ thống camera chống rung độc đáo như trên một chiếc gimbal thực sự, lần đầu tiên được trang bị trên smartphone hiện đại',N'IPS LCD, 6.51", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4315 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-x50-proa.png', 100, 5, 5, 1),
( N'Điện thoại Vivo V19', '7990000', N'Vivo V19 là mẫu smartphone tầm trung ra mắt vào đầu năm 2020 của Vivo. Thiết bị ghi điểm ở thiết kế thời trang, khả năng chụp ảnh đêm ấn tượng, cụm 4 camera đa dụng và công nghệ sạc nhanh vượt trội 33W.',N'Super AMOLED, 6.44", Full HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-v19a.png', 100, 5, 5, 1),
( N'Điện thoại Vivo V19 Neo', '6990000', N'Vivo V19 Neo là chiếc điện thoại tầm trung mới nhất đến từ Vivo nổi bật với thiết kế đẹp, bắt bắt, cụm 4 camera ấn tượng cùng cấu hình mạnh mẽ đáp ứng tốt nhu cầu sử dụng thông thường đến chơi game chất lượng cao.',N'Super AMOLED, 6.44", Full HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-v19-neoa.png', 100, 5, 5, 1),
( N'Điện thoại Vivo V20 SE', '6790000', N' Vivo V20 SE vẫn sở hữu những nét riêng biệt, đủ để thu hút sự chú ý của những ai yêu công nghệ.',N'Super AMOLED, 6.44", Full HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-v20a.png', 100, 5, 5, 1),
( N'Điện thoại Vivo Y50', '5590000', N'Vivo Y50 là chiếc điện thoại tầm trung sở hữu thiết kế hiện đại với màn hình tràn viền, cụm 4 camera đột phá, hiệu năng tốt hẹn sẽ tiếp tục trở thành một sản phẩm “ngon - bổ - rẻ” cho mọi người dùng.',N'Super AMOLED, 6.44", Full HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-y50a.png', 100, 5, 5, 1),
( N'Điện thoại Vivo S1 Pro', '5490000', N'Vivo S1 Pro là chiếc điện thoại tầm trung sở hữu ngoại hình đẹp, khó có thể chê đi kèm trang bị hấp dẫn với vân tay trong màn hình, camera selfie 32 MP đi kèm nhiều công nghệ hiện đại.',N'Super AMOLED, 6.44", Full HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-s1a.png', 100, 5, 5, 1),
( N'Điện thoại Vivo Y19', '4490000', N'Vivo Y19 là chiếc smartphone tập trung mạnh vào khả năng chụp ảnh ở camera chính lẫn camera selfie với công nghệ AI, hứa hẹn sẽ nhận được sự đón nhận tới từ người dùng là những bạn trẻ năng động và cá tính.',N'IPS LCD, 6.53", Full HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'vivo-y19a.png', 100, 5, 5, 1),
( N'Điện thoại Realme C17', '4990000', N'Nhà sản xuất Realme vừa mới trình làng chiếc điện thoại Realme C17 hứa hẹn sẽ đem đến cho người dùng những cải thiện tối ưu nhất về chất lượng lẫn thiết kế bên ngoài.',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-c17a.png', 100, 6, 6, 1),
( N'Điện thoại Realme 6i', '4690000', N'Realme tiếp tục cho ra đời người em kế nhiệm mang tên Realme 6i với hàng loạt những cải tiến như: MediaTek Helio G80, màn hình giọt nước, 4 camera sau',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-6ia.png', 100, 6, 6, 1),
( N'Điện thoại Realme C15', '3890000', N'Realme vừa cho ra mắt sản phẩm mới nhất là Realme C15 với mức giá vô cùng phải chăng.',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-c15a.png', 100, 6, 6, 1),
( N'Điện thoại Realme 5i (4GB/64GB)', '3690000', N'Realme 5i 4GB/64GB là một smartphone mới ra mắt của Realme trong năm 2020. Chiếc điện thoại nổi bật với thiết kế 4 camera hiện đại, hiệu năng tốt, dung lượng pin khủng cùng với giá bán cực kỳ hấp dẫn.',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-5ia.png', 100, 6, 6, 1),
( N'Điện thoại Realme C3 (3GB/64GB)', '3590000', N'Điện thoại giá rẻ Realme C3 (3GB/64GB) sở hữu hiệu năng vượt trội trong tầm giá với vi xử lý Helio G70, cụm camera sau đa tính năng, màn hình tràn viền thời thượng.',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-c3a.png', 100, 6, 6, 1),
( N'Điện thoại Realme C12', '3290000', N'Realme chính thức tung ra Realme C12. Mẫu điện thoại được xem là phiên bản nâng cấp của Realme C11 về pin với dung lượng cực khủng 6000 mAh - cao nhất từ trước đến nay trong các thế hệ smartphone đã từng ra mắt của Realme',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-c12a.png', 100, 6, 6, 1),
( N'Điện thoại Realme C11', '2690000', N' Smartphone hướng tới nhóm khách hàng đang tìm kiếm một sản phẩm có cấu hình tốt, camera chất lượng cùng một hiệu năng vừa đủ để có thể chiến mượt hầu hết các tựa game đình đám trên thị trường hiện nay',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-c11a.png', 100, 6, 6, 1),
( N'Điện thoại Realme 7 Pro', '8890000', N'Realme 7 Pro chính thức ra mắt. Nổi bật với 4 camera sau AI chuyên nghiệp, cấu hình mạnh mẽ và công nghệ sạc cực nhanh SuperDart 65W đi kèm nhiều tính năng nổi trội khác',N'IPS LCD, 6.5", HD+',N'Android 10',N'Chính 13 MP & Phụ 2 MP, 2 MP',N'8 MP',N'MediaTek Helio P35 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh' ,'12/12/2020', N'realme-7-proa.png', 100, 6, 6, 1),
( N'Điện thoại Mobell P41', '990000', N'Mobell thương hiệu di động đến từ "Đảo quốc sư tử" Singapore vừa cho ra mắt sản phẩm mới mang tên Mobell P41',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-p41a.png', 50, 9, 9, 1),
( N'Điện thoại Mobell S41', '590000', N'Mobell đã mang đến cho người dùng thêm một lựa chọn mới trong phân khúc điện thoại thông minh giá rẻ với cái tên Mobell S41 đáp ứng trọn vẹn cho các nhu cầu giải trí thường ngày',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-s41a.png', 50, 9, 9, 1),
( N'Điện thoại Mobell Rock 3', '490000', N'Mobell Rock 3 là bản nâng cấp của chiếc điện thoại Mobell trước đó với vẻ ngoài hầm hố đặc trưng của dòng điện thoại chống sốc cũng như va đập',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-rock-3a.png', 50, 9, 9, 1),
( N'Điện thoại Mobell M729', '490000', N'Mobell M729 là một trong những chiếc điện thoại trên thị trường hiện nay còn giữ lại kiểu thiết kế nắp gập vốn đã phổ biến từ nhiều năm trướ',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-m729a.png', 50, 9, 9, 1),
( N'Điện thoại Mobell M529', '450000', N'Mobell M529 là sự lựa chọn cho những người dùng muốn một chiếc điện thoại phổ thông giá rẻ có thiết kế sang trọng, hiện đại và đầy đủ tiện ích sử dụng.',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-m529a.png', 50, 9, 9, 1),
( N'Điện thoại Mobell M389', '390000', N'Mobell M389 là chiếc điện thoại giá rẻ có màn hình khá rộng, bàn phím to và loa sau lớn, là một sản phẩm phù hợp với người dùng lớn tuổi.',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-m389a.png', 50, 9, 9, 1),
( N'Điện thoại Mobell M229(2019)', '190000', N'Mobell M229 (2019) là một chiếc điện thoại cơ bản với ưu điểm là mức giá phải chăng, phù hợp với nhiều đối tượng người dùng.',N'IPS LCD, 5.5", FWVGA+',N'Android 8 (Oreo)',N'5 MP',N'2 MP',N'MediaTek MT6580A 4 nhân',N'1 GB',N'8 GB',N'2 Nano SIM, Không',N'3500 mAh, Không' ,'12/12/2020', N'mobell-m229a.png', 50, 9, 9, 1),
( N'Điện thoại iPhone 11 (Đỏ)', '19990000', N'Ngoài phiên bản 128GB, bạn cũng có thể lựa chọn cho mình điện thoại iPhone 11 64GB nếu nhu cầu sử dụng của bạn không quá nhiều.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh1a.png', 50, 1, 1, 15),
( N'Điện thoại iPhone 11 (Tím)', '19990000', N'Ngoài phiên bản 128GB, bạn cũng có thể lựa chọn cho mình điện thoại iPhone 11 64GB nếu nhu cầu sử dụng của bạn không quá nhiều.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh2a.png', 15, 1, 1, 15),
( N'Điện thoại iPhone 11 (Trắng)', '19990000', N'Ngoài phiên bản 128GB, bạn cũng có thể lựa chọn cho mình điện thoại iPhone 11 64GB nếu nhu cầu sử dụng của bạn không quá nhiều.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh3a.png', 33, 1, 1, 25),
( N'Điện thoại iPhone 11 (Xanh lá)', '19990000', N'Ngoài phiên bản 128GB, bạn cũng có thể lựa chọn cho mình điện thoại iPhone 11 64GB nếu nhu cầu sử dụng của bạn không quá nhiều.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh4a.png', 25, 1, 1, 35),
( N'Điện thoại iPhone 11 (Đen)', '19990000', N'Ngoài phiên bản 128GB, bạn cũng có thể lựa chọn cho mình điện thoại iPhone 11 64GB nếu nhu cầu sử dụng của bạn không quá nhiều.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh5a.png', 11, 1, 1,9),
( N'Điện thoại iPhone 11 Pro Max (Xám)', '27700000', N'Ra mắt cùng với iPhone 11 và 11 Pro là iPhone 11 Pro Max, đây mẫu smartphone cao cấp nhất của iPhone 11 Series được ra mắt năm 2019 và sắp tới là điện thoại iPhone 12 trong năm 2020.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh6a.png', 7, 1, 2, 15),
( N'Điện thoại iPhone 11 Pro Max (Trắng)', '27700000', N'Ra mắt cùng với iPhone 11 và 11 Pro là iPhone 11 Pro Max, đây mẫu smartphone cao cấp nhất của iPhone 11 Series được ra mắt năm 2019 và sắp tới là điện thoại iPhone 12 trong năm 2020.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh7a.png', 8, 1, 2, 15),
( N'Điện thoại iPhone 11 Pro Max (Vàng)', '27700000', N'Ra mắt cùng với iPhone 11 và 11 Pro là iPhone 11 Pro Max, đây mẫu smartphone cao cấp nhất của iPhone 11 Series được ra mắt năm 2019 và sắp tới là điện thoại iPhone 12 trong năm 2020.',
N'IPS LCD, 6.1", Liquid Retina',N'iOS 13',N'2 camera 12 MP',N'12 MP',N'Apple A13 Bionic 6 nhân',N'4 GB',N'64 GB',N'1 Nano SIM, Hỗ trợ 4G',N'3110 mAh, có sạc nhanh' ,
'2020-10-12', N'hinh8a.png', 18, 1, 2, 15),
( N'Điện thoại Samsung Galaxy Note 20 Ultra (Đen)', '25990000', N'Sau Galaxy Note 20 thì Galaxy Note 20 Ultra là phiên bản tiếp theo cao cấp hơn thuộc dòng Note 20 Series của Samsung, với nhiều thay đổi từ cụm camera hỗ trợ lấy nét laser AF cùng ống kính góc rộng mới, màn hình tràn viền lên đến 6.9 inch chắc chắn sẽ là chiếc điện thoại được săn đón của fan yêu thích công nghệ.',
N'Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)"',N'Android 10',N'Chính 108 MP & Phụ 12 MP',N'10 MP',N'Exynos 990 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh',
'2020-10-12', N'hinh9a.png', 20, 2, 4, 50),
( N'Điện thoại Samsung Galaxy Note 20 Ultra (Trắng)', '25990000', N'Sau Galaxy Note 20 thì Galaxy Note 20 Ultra là phiên bản tiếp theo cao cấp hơn thuộc dòng Note 20 Series của Samsung, với nhiều thay đổi từ cụm camera hỗ trợ lấy nét laser AF cùng ống kính góc rộng mới, màn hình tràn viền lên đến 6.9 inch chắc chắn sẽ là chiếc điện thoại được săn đón của fan yêu thích công nghệ.',
N'Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)"',N'Android 10',N'Chính 108 MP & Phụ 12 MP',N'10 MP',N'Exynos 990 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh',
'2020-10-12', N'hinh10a.png', 27, 2, 4, 66),
( N'Điện thoại Samsung Galaxy Note 20 Ultra (Vàng)', '25990000', N'Sau Galaxy Note 20 thì Galaxy Note 20 Ultra là phiên bản tiếp theo cao cấp hơn thuộc dòng Note 20 Series của Samsung, với nhiều thay đổi từ cụm camera hỗ trợ lấy nét laser AF cùng ống kính góc rộng mới, màn hình tràn viền lên đến 6.9 inch chắc chắn sẽ là chiếc điện thoại được săn đón của fan yêu thích công nghệ.',
N'Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)"',N'Android 10',N'Chính 108 MP & Phụ 12 MP',N'10 MP',N'Exynos 990 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh',
'2020-10-12', N'hinh11a.png', 18, 2, 4, 77),
( N'Điện thoại Samsung Galaxy Z Flip', '36000000', N'Cuối cùng sau bao nhiêu thời gian chờ đợi, chiếc điện thoại Samsung Galaxy Z Flip đã được Samsung ra mắt tại sự kiện Unpacked 2020. Siêu phẩm với thiết kế màn hình gập vỏ sò độc đáo, hiệu năng tuyệt đỉnh cùng nhiều công nghệ thời thượng, dẫn dầu 2020.',
N'Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)"',N'Android 10',N'Chính 108 MP & Phụ 12 MP',N'10 MP',N'Exynos 990 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh',
'2020-10-12', N'samsunga.png', 5, 2, 4, 10),
( N'Điện thoại Samsung Galaxy Z Fold2 5G', '50000000', N'Samsung Galaxy Z Fold 2 là tên gọi chính thức của điện thoại màn hình gập cao cấp nhất của Samsung. Với nhiều nâng cấp tiên phong về thiết kế, hiệu năng và camera, hứa hẹn đây sẽ là một siêu phẩm thành công tiếp theo đến từ “ông trùm” sản xuất điện thoại lớn nhất thế giới.  ',
N'Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)"',N'Android 10',N'3 camera 12 MP',N'10 MP',N'Exynos 990 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G',N'4500 mAh, có sạc nhanh',
'2020-10-12', N'samsung1a.png', 5, 2, 4, 10),
( N'Huawei Nova 7i', '5900000', N'sau thành công dòng sản phẩm Nova 3i, Nova 5i, Huawei tiếp tục cho ra mắt người kế nhiệm mang tên Huawei Nova 7i với nhiều đột phá về cấu hình, thiết kế và camera. Đi kèm với giá thành phải chăng, thiết bi hứa hẹn tạo nên cơn sốt điện thoại cho năm 2020.',
N'LTPS LCD, 6.4", Full HD+',N'EMUI 10 (Android 10 không có Google)',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'16 MP',N'Kirin 810 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh13a.png', 10, 8, 5, 70),
( N'Huawei Mate 30 Pro', '14990000', N'Những năm gần đây thì Huawei luôn mang tới cho người dùng sự bất ngờ với những trang bị đột phá lần đầu tiên xuất hiện trên chiếc smartphone của mình và mới đây chiếc Huawei Mate 30 Pro đã chính thức ra mắt và nó vẫn mang trong mình rất nhiều công nghệ mang tính đột phá của Huawei.',
N'LTPS LCD, 6.4", Full HD+',N'EMUI 10 (Android 10 không có Google)',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'16 MP',N'Kirin 810 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh14a.png', 7, 8, 5, 77),
( N'Huawei P40', '15990000', N'Chiếc điện thoại cao cấp Huawei P40 mới được Huawei giới thiệu vào tháng 3/2020. Với thiết kế tinh tế, hiệu năng khủng cùng hệ thống camera ấn tượng, chiếc smartphone hứa hẹn sẽ tạo nên làn sóng mới cho thị trường điện thoại di động 2020.',
N'LTPS LCD, 6.4", Full HD+',N'EMUI 10 (Android 10 không có Google)',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'16 MP',N'Kirin 810 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh15a.png', 9, 8, 5, 28),
( N'Xiaomi Mi 10T Pro 5G', '12990000', N'Mi 10T Pro 5G mẫu smartphone cao cấp của Xiaomi trong năm 2020 cuối cùng cũng được trình làng với loạt những thông số gây “choáng ngợp”: màn hình tần số quét 144 Hz, vi xử lý Snapdragon 865 và cụm camera khủng 108 MP kèm theo đó là một mức giá dễ chịu cho người dùng.',
N'LTPS LCD, 6.4", Full HD+',N'EMUI 10 (Android 10 không có Google)',N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP',N'16 MP',N'Kirin 810 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh16a.png', 22, 8, 5, 12),
( N'Xiaomi Mi 10T Pro 5G', '12990000', N'Mi 10T Pro 5G mẫu smartphone cao cấp của Xiaomi trong năm 2020 cuối cùng cũng được trình làng với loạt những thông số gây “choáng ngợp”: màn hình tần số quét 144 Hz, vi xử lý Snapdragon 865 và cụm camera khủng 108 MP kèm theo đó là một mức giá dễ chịu cho người dùng.',
N'IPS LCD, 6.67", Full HD+',N'Android 10',N'Chính 108 MP',N'20 MP',N'Snapdragon 865 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh17a.png', 22, 4, 6, 12),
( N'Xiaomi POCO X3 NFC 128GB', '6990000', N'Tiếp nối sự thành công về thế mạnh là điện thoại tầm trung với thiết kế hiện đại sang trọng, Xiaomi đã cho ra mắt Xiaomi POCO X3 NFC mang theo nhiều tính năng hấp dẫn trên 1 chiếc điện thoại thông minh, cụm camera chất lượng, hiệu năng mạnh mẽ, dung lượng pin khủng cùng khả năng sạc nhanh vượt trội 33W.',
N'IPS LCD, 6.67", Full HD+',N'Android 10',N'Chính 108 MP',N'20 MP',N'Snapdragon 865 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh18a.png', 28, 4, 6, 36),
( N'Xiaomi Redmi Note 9s 4G 64GB', '4800000', N'Nhanh như một cơn gió, sức hot của Redmi Note 9 Pro chưa có dấu hiệu hạ nhiệt thì Xiaomi Redmi 9 vừa bất ngờ ra mắt sớm. Thiết bị mang một thiết kế mới, thời trang và nhỏ gọn, phần cứng được nâng cấp cùng thời lượng pin ấn tượng, đặc biệt đi kèm một mức giá bán không thể nào hấp dẫn hơn.',
N'IPS LCD, 6.67", Full HD+',N'Android 10',N'Chính 108 MP',N'20 MP',N'Snapdragon 865 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh19a.png', 12, 4, 6, 29),
( N'Xiaomi Redmi 9A', '1900000', N' Tiếp nối thành công của dòng sản phẩm Redmi 9 mới vừa ra mắt đầu tháng 6/2020 Xiaomi vừa lặng lẽ ra mắt chiếc điện thoại Redmi 9A tại thị trường Malaysia. Đây là dòng sản phẩm smartphone hướng tới nhóm khách hàng đang tìm kiếm cho mình một sản phẩm với cấu hình tốt giá thành phải chăng, cũng như được trang bị đầy đủ các tính năng ấn tượng.',
N'IPS LCD, 6.67", Full HD+',N'Android 10',N'Chính 108 MP',N'20 MP',N'Snapdragon 865 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh20a.png', 12, 4, 6, 55),
( N'POCO F2 PRO', '11500000', N' POCO F2 Pro là một flagship mới nhất của hãng điện thoại Xiaomi-POCO trong năm 2020. Vẫn giữ nguyên triết lý sản phẩm cấu hình mạnh mẽ với giá phải chăng, đây chắc chắn sẽ là sự lựa chọn tuyệt vời dành cho bạn.',
N'IPS LCD, 6.67", Full HD+',N'Android 10',N'Chính 108 MP',N'20 MP',N'Snapdragon 865 8 nhân',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh21a.png', 28, 4, 6, 17),
( N'Nokia 2.4', '2990000', N' Nokia 2.4 là một trong những smartphone nổi bật trong phân khúc điện thoại tầm trung với nhiều nâng cấp về ngoại hình lẫn chất lượng bên trong hứa hẹn mang lại trải nghiệm sử dụng nhiều tiện ích và chất lượng cao cấp cho người dùng.',
N'LCD, 6.81", Full HD+',N'Android 10',N'Chính 13 MP',N'20 MP',N'MediaTek MT6762 8 nhân (Helio P22)',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh22a.png', 65, 7, 8, 76),
( N'Điện thoại Nokia 8.3 5G', '11990000', N' Nokia 8.3 nổi bật với danh hiệu smartphone 5G đầu tiên của Nokia, bên cạnh đó là những cải tiến mạnh mẽ về hiệu năng và chất lượng camera.',
N'LCD, 6.81", Full HD+',N'Android 10',N'Chính 13 MP',N'20 MP',N'MediaTek MT6762 8 nhân (Helio P22)',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh23a.png', 67, 7, 8, 45),
( N'Điện thoại Nokia 5.3', '2890000', N' Nokia 5.3 tiếp tục là một chiếc smartphone thuộc phân khúc tầm trung vừa được HMD Global ra mắt. Chiếc máy được nâng cấp mạnh với cụm camera đa năng thiết kế tròn lạ mắt, vi xử lý Snapdragon 665 cùng màn hình tràn viền lớn 6.55 inch.',
N'LCD, 6.81", Full HD+',N'Android 10',N'Chính 13 MP',N'20 MP',N'MediaTek MT6762 8 nhân (Helio P22)',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh24a.png', 65, 7, 8, 87),
( N'Điện thoại Nokia C2', '1490000', N' Nokia C2 là một smartphone giá rẻ chạy Android Go, máy có màn hình rộng, hiệu năng ổn định cùng với mức giá hấp dẫn dễ tiếp cận đến người dùng có nhu cầu cơ bản, phổ thông.',
N'LCD, 6.81", Full HD+',N'Android 10',N'Chính 13 MP',N'20 MP',N'MediaTek MT6762 8 nhân (Helio P22)',N'8 GB',N'256 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh25a.png', 75, 7, 8, 87),
( N'Điện thoại Vsmart Aris (8GB/128GB)', '7490000', N' Dạo gần đây, Vsmart đang dần khẳng định vị thế, tên tuổi của mình trên thị trường smartphone Việt Nam. Và Vsmart Aris 8GB/128GB là sản phẩm mà Vsmart muốn giới thiệu đến người dùng hàng loạt các tính năng hấp dẫn, xịn sò trên thiết bị này.',
N'AMOLED, 6.39", Full HD+',N'Android 10',N'Chính 64 MP',N'20 MP',N'Snapdragon 730 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh26a.png', 99, 10, 9, 45),
( N'Điện thoại Vsmart Joy 4 (4GB/64GB)', '3590000', N' Vsmart Joy 4 là mẫu smartphone giá rẻ thừa hưởng nhiều ưu điểm từ đàn anh Vsmart Live 4 đã chính thức được giới thiệu đến người dùng. Những tính năng mới mẻ, cấu hình nổi trội đi kèm với mức giá tốt vẫn là điểm mạnh được Vsmart duy trì trên mẫu smartphone mới của mình.',
N'AMOLED, 6.39", Full HD+',N'Android 10',N'Chính 64 MP',N'20 MP',N'Snapdragon 730 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh27a.png', 45, 10, 9, 67),
( N'Điện thoại Vsmart Aris Pro', '8990000', N' Thương hiệu smartphone Việt - Vsmart đã chính thức trình làng Vsmart Aris Pro. Sự ra mắt mẫu điện thoại này đánh dấu một bước ngoặc lớn trong làng smartphone với công nghệ camera ẩn trong màn hình, mức giá hợp lý giúp người Việt có cơ hội tiếp cận những công nghệ mới nhất hiện nay.',
N'AMOLED, 6.39", Full HD+',N'Android 10',N'Chính 64 MP',N'20 MP',N'Snapdragon 730 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh28a.png', 87, 10, 9, 98),
( N'Điện thoại Vsmart Live 4 4GB', '4390000', N' Đặc điểm nổi bật của Vsmart Live 4 4GB.Bộ sản phẩm chuẩn: Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp, Cây lấy sim, Ốp lưngNối tiếp thành công Vsmart Live, hãng tiếp tục cho ra mắt chiếc Vsmart Live 4 nhằm đem lại cho người dùng thêm sự lựa chọn trong phân khúc, kế thừa các ưu điểm từ đàn anh, sản phẩm hứa hẹn sẽ mang lại thêm thành công cho điện thoại thương hiệu Việt.',
N'AMOLED, 6.39", Full HD+',N'Android 10',N'Chính 64 MP',N'20 MP',N'Snapdragon 730 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh29a.png', 68, 10, 9, 65),
( N'Điện thoại Vsmart Star 4 (2GB/16GB)', '2050000', N'Vsmart bổ sung thêm một tùy chọn mới cho dòng sản phẩm smartphone giá rẻ Vsmart Star 4 với phiên bản RAM 2 GB và 16 GB bộ nhớ trong, giúp cho máy có một mức giá hấp dẫn hơn, đáp ứng cho những người chỉ sử dụng tính năng cơ bản nhất.',
N'AMOLED, 6.39", Full HD+',N'Android 10',N'Chính 64 MP',N'20 MP',N'Snapdragon 730 8 nhân',N'8 GB',N'128 GB',N'2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G',N'4200 mAh, có sạc nhanh',
'2020-10-12', N'hinh30a.png', 67, 10, 9, 32)


set dateformat dmy
insert into DonHang
values
('24/12/2020','24/12/2020', NULL, NULL, 5),
('23/12/2020','24/12/2020', NULL, NULL, 2),
('22/12/2020','24/12/2020', NULL, NULL, 3)

insert into ChiTietDonHang
values
(1,1, 1, CAST(85000 AS Decimal(18, 0))),
(2,1, 2, CAST(75000 AS Decimal(18, 0))),
(3,1, 1, CAST(55000 AS Decimal(18, 0)))
