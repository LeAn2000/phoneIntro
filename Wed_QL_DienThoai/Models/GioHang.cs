using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wed_QL_DienThoai.Models
{
    public class GioHang
    {
        public List<CartItem> listDT;

        public GioHang()
        {
            listDT = new List<CartItem>();
        }

        public GioHang(List<CartItem> ds)
        {
            listDT = ds;
        }

        //pt tinh toan
        public int SoMatHang()
        {
            return listDT.Count;
        }
        public int TongSoSach()
        {
            if (listDT == null)
                return 0;
            return listDT.Sum(s => s.iSoLuong);
        }
        public double TongThanhTien()
        {
            if (listDT == null)
                return 0;
            return listDT.Sum(s => s.ThanhTien);
        }
        public int Them(int ms)
        {

            CartItem sach = listDT.SingleOrDefault(s => s.iMaDT == ms);
            if (sach == null)
            {
                CartItem sp = new CartItem(ms);
                if (sp == null)
                {
                    return -1;
                }
                listDT.Add(sp);
            }
            else
            {
                sach.iSoLuong = sach.iSoLuong + 1;

            }
            return 1;
        }
        public void Xoa()
        {

            listDT.Clear();
        }
    }
}