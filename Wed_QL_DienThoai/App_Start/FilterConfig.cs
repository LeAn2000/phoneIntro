using System.Web;
using System.Web.Mvc;

namespace Wed_QL_DienThoai
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}