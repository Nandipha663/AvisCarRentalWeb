using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AvisSystem.Startup))]
namespace AvisSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
