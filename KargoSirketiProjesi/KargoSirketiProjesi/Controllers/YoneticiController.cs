using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KargoSirketiProjesi.Models;

namespace KargoSirketiProjesi.Controllers
{
    public class YoneticiController : Controller
    {
        public KargoSirketiDBEntities db = new KargoSirketiDBEntities();

        public ActionResult Index()
        {
            int yetkiId = Convert.ToInt32(Session["PrYetkiId"]);
            if (yetkiId == 1)
            {
                int subeId = Convert.ToInt32(Session["PrSubeId"]);
                var personeller = db.Personeller.Where(p => p.PrSubeId == subeId).ToList();
                return View(personeller);
            }
            else
            {
                return RedirectToAction("Index", "Giris");
            }
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Personeller personeller = db.Personeller.Find(id);
            if (personeller == null)
            {
                return HttpNotFound();
            }
            return View(personeller);
        }

        public ActionResult Create()
        {
            ViewBag.PrSubeId = new SelectList(db.Subeler, "SubeId", "SubeKonum");
            ViewBag.PrYetkiId = new SelectList(db.Yetkiler, "YetkiId", "YetkiTipi");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PrId,PrAdSoyad,PrKullanici,PrSifre,PrSubeId,PrYetkiId")] Personeller personeller)
        {
            if (ModelState.IsValid)
            {
                db.Personeller.Add(personeller);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PrSubeId = new SelectList(db.Subeler, "SubeId", "SubeKonum", personeller.PrSubeId);
            ViewBag.PrYetkiId = new SelectList(db.Yetkiler, "YetkiId", "YetkiTipi", personeller.PrYetkiId);
            return View(personeller);
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Personeller personeller = db.Personeller.Find(id);
            if (personeller == null)
            {
                return HttpNotFound();
            }
            ViewBag.PrSubeId = new SelectList(db.Subeler, "SubeId", "SubeKonum", personeller.PrSubeId);
            ViewBag.PrYetkiId = new SelectList(db.Yetkiler, "YetkiId", "YetkiTipi", personeller.PrYetkiId);
            return View(personeller);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PrId,PrAdSoyad,PrKullanici,PrSifre,PrSubeId,PrYetkiId")] Personeller personeller)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personeller).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PrSubeId = new SelectList(db.Subeler, "SubeId", "SubeKonum", personeller.PrSubeId);
            ViewBag.PrYetkiId = new SelectList(db.Yetkiler, "YetkiId", "YetkiTipi", personeller.PrYetkiId);
            return View(personeller);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Personeller personeller = db.Personeller.Find(id);
            if (personeller == null)
            {
                return HttpNotFound();
            }
            return View(personeller);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Personeller personeller = db.Personeller.Find(id);
            db.Personeller.Remove(personeller);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Yonlendir()
        {
            int yetkiId = Convert.ToInt32(Session["PrYetkiId"]);
            if (yetkiId == 1)
            {
                int subeId = Convert.ToInt32(Session["PrSubeId"]);
                var calisanlar = db.Personeller.Where(p =>p.PrSubeId == subeId  && p.PrYetkiId == 2).ToList();
                ViewBag.calisanlar = calisanlar;
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Giris");
            }
        }

        [HttpPost]
        public ActionResult Yonlendir(FormCollection fc)
        {
            string KrBaslik = fc["KrBaslik"];
            string KrNot = fc["KrNot"];
            string KrAdres = fc["KrAdres"];
            int SelectCl = Convert.ToInt32(fc["SelectCal"]);

            Kargolar kargo = new Kargolar();

            kargo.KargoBaslik= KrBaslik;
            kargo.KargoNot = KrNot;
            kargo.KargoAdres = KrAdres;
            kargo.KargoPrID = SelectCl;
            kargo.KargoAlımTarih = DateTime.Now;
            kargo.KargoDurumId = 1;
            db.Kargolar.Add(kargo);
            db.SaveChanges();

            return RedirectToAction("Takip", "Yonetici");
        }
        
        public ActionResult Takip()
        {
            int yetkiId = Convert.ToInt32(Session["PrYetkiId"]);
            if (yetkiId == 1)
            {
                int subeId = Convert.ToInt32(Session["PrSubeId"]);
                var calisanlar = db.Personeller.Where(p => p.PrSubeId == subeId && p.PrYetkiId == 2).ToList();
                ViewBag.calisanlar = calisanlar;
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Giris");
            }
        }

        [HttpPost]
        public ActionResult Takip(int selectCal)
        {
            var calisan = (from p in db.Personeller where p.PrId == selectCal select p).FirstOrDefault();
            TempData["selectcl"] = calisan;
            return RedirectToAction("Liste", "Yonetici");
        }

        public ActionResult Liste()
        {
            int yetkiId = Convert.ToInt32(Session["PrYetkiId"]);
            if (yetkiId == 1)
            {
                Personeller selectc = (Personeller)TempData["selectcl"];

                try
                {
                    var kargolar = db.Kargolar.Where(x => x.KargoPrID == selectc.PrId).ToList().OrderByDescending(x => x.KargoAlımTarih);
                    ViewBag.kargolar = kargolar;
                    ViewBag.calisan = selectc;
                    ViewBag.calisanissayisi = kargolar.Count();
                    return View();
                }
                catch (Exception)
                {
                    return RedirectToAction("Takip", "Yonetici");
                }
            }
            else
            {
                return RedirectToAction("Index", "Giris");
            }
        }
    }
}
