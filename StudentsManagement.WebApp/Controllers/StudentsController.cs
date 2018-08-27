using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentsManagement.DAO;


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
	}
}