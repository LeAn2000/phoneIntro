using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wed_QL_DienThoai.Models;
namespace Wed_QL_DienThoai.Controllers
{
    public class LayoutController : Controller
    {
        //
        // GET: /Layout/
        DBQuanLiDTDataContext db = new DBQuanLiDTDataContext();
        public ActionResult Trangchu()
        {
            return View();
        }
        public ActionResult DanhsachSp()
        {
            List<DienThoai> dsdt = db.DienThoais.OrderBy(n=>n.NgayCapNhat).Take(12).ToList();
            List<LOAI> dsloai = db.LOAIs.ToList();
            ViewBag.dsl = dsloai;
            return View(dsdt);
        }
        public ActionResult SanphamTheoLoai(int id)
        {
            List<DienThoai> dsdt= db.DienThoais.Where(n=>n.MaLoai==id).ToList();
            List<LOAI> dsloai = db.LOAIs.ToList();
            ViewBag.dsl = dsloai;
            return View(dsdt);
            
        }
        public ActionResult ChitietDT(int madt)
        {
            DienThoai dt = db.DienThoais.SingleOrDefault(n => n.MaDT == madt);
            List<DienThoai> dsdt = db.DienThoais.Where(n => n.GiaBan<=dt.GiaBan).Take(6).ToList();
            ViewBag.dscl = dsdt;
            List<LOAI> dsloai = db.LOAIs.ToList();
            ViewBag.dsl = dsloai;
            if (dt == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dt);
        }
        
        public ActionResult Search()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult SearchPost(FormCollection c)
        {
            string t = c["txtTen"];
            List<DienThoai> dsSearch = db.DienThoais.Where(x => x.TenDT.Contains(t)).ToList();
            List<LOAI> dsloai = db.LOAIs.ToList();
            ViewBag.dsl = dsloai;
            return View(dsSearch);
        }
        public ActionResult Khuyenmai()
        {
            return View();
        }
        public ActionResult SearchNC()
        {
            ViewBag.MaLoai = new SelectList(data.LOAIs.ToList(), "MaLoai", "TenLoai");
            return View();
        }
        [HttpPost]
        public ActionResult SearchNC(FormCollection c)
        {
            List<LOAI> dsloai = db.LOAIs.ToList();
            ViewBag.dsl = dsloai;
            string ten = c["txtTen"];
            int mcd = int.Parse(c["MaLoai"]);
            List<DienThoai> ds = data.DienThoais.Where(t => t.TenDT.Contains(ten)).ToList();
            List<DienThoai> ds1 = ds.Where(s => s.MaLoai == mcd).ToList();

            List<DienThoai> dskq = new List<DienThoai>();
            if (c["g1"] == "1")
            {
                List<DienThoai> d1 = ds1.Where(s => s.GiaBan >= 0 && s.GiaBan <= 1000000).ToList();
                dskq.AddRange(d1);
            }
            if (c["g2"] == "2")
            {
                List<DienThoai> d2 = ds1.Where(s => s.GiaBan >= 1000000 && s.GiaBan <= 5000000).ToList();
                dskq.AddRange(d2);
            }
            if (c["g3"] == "3")
            {
                List<DienThoai> d3 = ds1.Where(s => s.GiaBan >= 5000000 && s.GiaBan <= 10000000).ToList();
                dskq.AddRange(d3);
            }
            if (c["g4"] == "4")
            {
                List<DienThoai> d4 = ds1.Where(s => s.GiaBan >= 10000000).ToList();
                dskq.AddRange(d4);
            }
            return View("DanhsachSp", dskq);

        }
        //LayGH
        //public List<CartItem> Laygiohang()
        //{
        //    List<CartItem> Lstgh = Session["gh"] as List<CartItem>;
        //    if (Lstgh == null)
        //    {
        //        Lstgh = new List<CartItem>();
        //        Session["gh"] = Lstgh;
        //    }
        //    return Lstgh;
        //}
        /*----------------------xóa 1 sản phẩm---------------------*/
        //public ActionResult XoaGioHang(int MaDT)
        //{
        //    List<GioHang> lstGioHang = 
        //    GioHang sp = lstGioHang.Single(s => s.iMaDT == MaDT);
        //    if (sp != null)
        //    {
        //        lstGioHang.RemoveAll(s => s.iMaDT == MaDT);
        //        return RedirectToAction("GioHang", "GioHang");
        //    }
        //    if (lstGioHang.Count == 0)
        //    {
        //        return RedirectToAction("DanhsachSp", "Layout");
        //    }
        //    return RedirectToAction("XemGioHang", "Layout");
        //}
        /*-----------------dangnhap------------------*/
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection c)
        {

            string ten = c["txttk"];
            string mk = c["txtmk"];
            KhachHang khach = db.KhachHangs.FirstOrDefault(k => k.TaiKhoan == ten && k.MatKhau == mk);
            if (khach == null)
                return View();

            Session["kh"] = khach;
            return RedirectToAction("Trangchu", "Layout");
        }

        public ActionResult KhoiTaoLayout()
        {
            GioHang gio = (GioHang)Session["gh"];
            KhachHang kh = Session["kh"] as KhachHang;
            ViewBag.a = kh;
            return PartialView(gio);
        }
        public ActionResult KhoiTaoLayout2()
        {
            GioHang gio = (GioHang)Session["gh"];
            KhachHang kh = Session["kh"] as KhachHang;
            ViewBag.a = kh;
            return PartialView(gio);
        }
        public ActionResult Lienhe()
        {
            return View();
        }

        /*-----------------dangky------------------*/
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection c, KhachHang kh)
        {

            string ten = c["txttk"];
            string mk = c["txtmk"];
            string email = c["txtemail"];
            if (ten == "" || mk == "" || email == "")
            {
                return View();
            }
            else 
            {
                kh.TaiKhoan = ten;
                kh.MatKhau = mk;
                kh.Email = email;
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap", "Layout");
            }
            
        }
        ///////dat hang
        DBQuanLiDTDataContext data = new DBQuanLiDTDataContext();
        public ActionResult ThemMatHang(int msp)
        {
            GioHang gh = (GioHang)Session["gh"];
            if (gh == null)
                gh = new GioHang();
            int kq = gh.Them(msp);
            Session["gh"] = gh;
            return RedirectToAction("DanhsachSp", "Layout");
        }
        public ActionResult XoaMatHang()
        {
            GioHang gh = (GioHang)Session["gh"];
            gh.Xoa();
            Session["gh"] = gh;
            return RedirectToAction("DanhsachSp", "Layout");
        }

        public ActionResult XemGioHang()

        {
            GioHang gh = (GioHang)Session["gh"];
            return View(gh);
        }
        [HttpGet]
        public ActionResult XacNhanDonHang()
        {
            KhachHang Khach = Session["kh"] as KhachHang;
            if (Khach == null)
                return RedirectToAction("DangNhap", "Layout");

            GioHang gh = (GioHang)Session["gh"];

            if (gh == null || gh.SoMatHang() == 0)
                return RedirectToAction("XemGioHang", "Layout");
            ViewBag.khach = Khach;
            return View(gh);
        }
        [HttpPost]
        public ActionResult LuuDonHang(FormCollection c)
        {
            string ngayhengiao = c["txtDate"];
            DateTime ngayhen = DateTime.Parse(ngayhengiao);

            KhachHang khach = Session["kh"] as KhachHang;

            DonHang hd = new DonHang(); 
            hd.NgayDat = DateTime.Now;
            hd.MaKH = khach.MaKH;
            hd.NgayGiao = ngayhen;
            data.DonHangs.InsertOnSubmit(hd);
            data.SubmitChanges();

            GioHang gio = Session["gh"] as GioHang;

            foreach (CartItem item in gio.listDT)
            {
                ChiTietDonHang ct = new ChiTietDonHang();
                ct.MaDonHang = hd.MaDonHang;
                ct.MaDT = item.iMaDT;
                ct.SoLuong = item.iSoLuong;
                data.ChiTietDonHangs.InsertOnSubmit(ct);
            }
            data.SubmitChanges();

            Session["gh"] = null;

            return View();
        }
    }
}
