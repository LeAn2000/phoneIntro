using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wed_QL_DienThoai.Models
{
    public class CartItem
    {
        public int iMaDT { get; set; }
        public string sTenDT { get; set; }
        public string sAnhBia { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double ThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }
        DBQuanLiDTDataContext data = new DBQuanLiDTDataContext();

        public CartItem(int MaDT)
        {
            DienThoai dienthoai = data.DienThoais.Single(n => n.MaDT == MaDT);
            if (dienthoai != null)
            {
                iMaDT = MaDT;
                sTenDT = dienthoai.TenDT;
                sAnhBia = dienthoai.Anh;
                dDonGia = double.Parse(dienthoai.GiaBan.ToString());
                iSoLuong = 1;
            }
        }
    }
}