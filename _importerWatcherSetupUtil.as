package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importerWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         importer.watcherSetupUtil = new _importerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[48] = new PropertyWatcher("_flashs",{"propertyChange":true},[param4[52]],param2);
         param5[49] = new PropertyWatcher("item",{"propertyChange":true},[param4[52]],null);
         param5[9] = new PropertyWatcher("_hasConsole",{"propertyChange":true},[param4[8]],param2);
         param5[50] = new PropertyWatcher("_sounds",{"propertyChange":true},[param4[53]],param2);
         param5[51] = new PropertyWatcher("item",{"propertyChange":true},[param4[53]],null);
         param5[12] = new PropertyWatcher("height",{"heightChanged":true},[param4[11],param4[24]],param2);
         param5[52] = new PropertyWatcher("_images",{"propertyChange":true},[param4[54]],param2);
         param5[53] = new PropertyWatcher("item",{"propertyChange":true},[param4[54]],null);
         param5[46] = new PropertyWatcher("_movies",{"propertyChange":true},[param4[51]],param2);
         param5[47] = new PropertyWatcher("item",{"propertyChange":true},[param4[51]],null);
         param5[0] = new PropertyWatcher("_bg",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("application",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[3] = new PropertyWatcher("height",null,[param4[2]],null);
         param5[2] = new PropertyWatcher("width",null,[param4[1]],null);
         param5[11] = new PropertyWatcher("width",{"widthChanged":true},[param4[10],param4[23]],param2);
         param5[13] = new PropertyWatcher("_charArray",{"propertyChange":true},[param4[12]],param2);
         param5[48].updateParent(param1);
         param5[48].addChild(param5[49]);
         param5[9].updateParent(param1);
         param5[50].updateParent(param1);
         param5[50].addChild(param5[51]);
         param5[12].updateParent(param1);
         param5[52].updateParent(param1);
         param5[52].addChild(param5[53]);
         param5[46].updateParent(param1);
         param5[46].addChild(param5[47]);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[3]);
         param5[1].addChild(param5[2]);
         param5[11].updateParent(param1);
         param5[13].updateParent(param1);
      }
   }
}
