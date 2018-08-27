using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentsManagement.DAO;
using System.Net;


namespace StudentsManagement.WebApp.Controllers
{
    public class StudentsController : Controller
    {
        StudentManagementEntities db = new StudentManagementEntities();
        //
        // GET: /Students/
        public ActionResult Index(string name="")
        {
            return View(db.FindStudents(name).ToList());
        }
        [HttpPost]
        public ActionResult Delete(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student s = db.Student.Find(id);
            db.Student.Remove(s);
            db.SaveChanges();
            return RedirectToAction("Index","Students");
        }

     
	}
}