using System.Web.Routing;
using DotNetNuke.Web.Api;

namespace Christoc.Modules.DNNSignalR.Components
{
    public class RouteMapper: IServiceRouteMapper
	     {
	         public void RegisterRoutes(IMapRoute mapRouteManager)
	         {
	             RouteTable.Routes.MapHubs();
	         }
	     }
}