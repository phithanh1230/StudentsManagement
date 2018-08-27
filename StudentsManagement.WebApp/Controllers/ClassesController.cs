using StudentsManagement.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentsManagement.WebApp.Controllers
{
    public class ClassesController : Controller
    {
        StudentManagementEntities db = new StudentManagementEntities();
        //
        // GET: /Classes/
        public ActionResult Index()
        {
            return View(db.Class.ToList());
        }
	}
}