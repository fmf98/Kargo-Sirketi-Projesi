using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KargoSirketiProjesi.Controllers
{
    public class CikisController : Controller
    {
        
        public ActionResult Index()
        {
            Session.Abandon();
            return RedirectToAction("Index","Giris");
        }
    }
}