using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StudentsManagement.WebApp.Startup))]
namespace StudentsManagement.WebApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
