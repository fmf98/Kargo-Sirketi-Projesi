using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KargoSirketiProjesi.Models;

namespace KargoSirketiProjesi.Controllers
{
    public class GirisController : Controller
    {
        KargoSirketiDBEntities db = new KargoSirketiDBEntities();
        public ActionResult Index()
        {
            ViewBag.mesaj = null;
            return View();
        }
        [HttpPost]
        public ActionResult Index(string kullaniciAd, string parola)
        {
            var personel = db.Personeller.FirstOrDefault(x=>x.PrKullanici == kullaniciAd && x.PrSifre == parola);
            if (personel != null)
            {
                Session["PrAdSoyad"] = personel.PrAdSoyad;
                Session["PrId"] = personel.PrId;
                Session["PrSubeId"] = personel.PrSubeId;
                Session["PrYetkiId"] = personel.PrYetkiId;

                switch (personel.PrYetkiId)
                {
                    case 1:
                        return RedirectToAction("Index", "Yonetici");
                    case 2:
                        return RedirectToAction("Index", "Calisan");
                    default: return View();
                }
            }
            else
            {
                ViewBag.mesaj = "Kullanıcı adınız veya parolanız yanlış";
                return View();
            }
        }
    }
}