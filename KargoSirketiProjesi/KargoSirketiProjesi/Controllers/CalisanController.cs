using KargoSirketiProjesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KargoSirketiProjesi.Controllers
{
    public class KrDur
    {
        public string KargoBaslik { get; set; }
        public string KargoNot { get; set; }
        public string KargoAdres { get; set; }
        public DateTime? KargoAlımTarih { get; set; }
        public DateTime? KargoTeslimTarih { get; set; }
        public string KargoDurumAd { get; set; }
    }
    public class CalisanController : Controller
    {
        KargoSirketiDBEntities db = new KargoSirketiDBEntities();
        public ActionResult Index()
        {
            int yetkiId = Convert.ToInt32(Session["PrYetkiId"]);
            if (yetkiId == 2)
            {
               int calisan = Convert.ToInt32(Session["PrId"]);
               var kargo = (from x in db.Kargolar
                                 join y in db.KargoDurum on x.KargoDurumId equals y.KargoDurumId
                                 where x.KargoPrID == calisan
                                 select x).ToList().OrderByDescending(x => x.KargoAlımTarih);
               KargoDurumlarıModel mdl = new KargoDurumlarıModel();
               List<KrDur> k = new List<KrDur>();
               foreach(var kr in kargo)
               {
                 KrDur karDu = new KrDur();
                 karDu.KargoBaslik = kr.KargoBaslik;
                 karDu.KargoNot = kr.KargoNot;
                 karDu.KargoAdres = kr.KargoAdres;
                 karDu.KargoAlımTarih = kr.KargoAlımTarih;
                 karDu.KargoTeslimTarih = kr.KargoTeslimTarih;
                 karDu.KargoDurumAd = kr.KargoDurum.KargoDurumAd;
                 k.Add(karDu);
               }
                mdl.KrDur=k;
               
               
               return View(mdl);
            }
            else
            {
                return RedirectToAction("Index", "Giris");
            }
        }

        public ActionResult Onay()
        {
            int yetkiId = Convert.ToInt32(Session["PrYetkiId"]);
            if (yetkiId == 2)
            {
                int prId = Convert.ToInt32(Session["PrId"]);
                var kargolar = db.Kargolar.Where(x=>x.KargoPrID== prId && x.KargoDurumId==1).ToList().OrderByDescending(x=>x.KargoAlımTarih);
                ViewBag.kargo = kargolar;
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Giris");
            }
        }

        [HttpPost]
        public ActionResult Onay(int KargoId)
        {
            var kargo = db.Kargolar.FirstOrDefault(x=>x.KargoId== KargoId);
            kargo.KargoTeslimTarih = DateTime.Now;
            kargo.KargoDurumId = 2;
            db.SaveChanges();
            return RedirectToAction("Index", "Calisan");
        }
    }
}