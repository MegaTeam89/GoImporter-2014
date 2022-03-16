package
{
   import importer.panes.UploadFileWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importer_panes_UploadFileWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importer_panes_UploadFileWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         UploadFileWindow.watcherSetupUtil = new _importer_panes_UploadFileWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_upload_message",{"propertyChange":true},[param4[0],param4[1],param4[9],param4[10]],param2);
         param5[2] = new PropertyWatcher("_txtFile",{"propertyChange":true},[param4[3],param4[4],param4[5]],param2);
         param5[5] = new PropertyWatcher("width",{"widthChanged":true},[param4[5]],null);
         param5[4] = new PropertyWatcher("y",{"yChanged":true},[param4[4]],null);
         param5[3] = new PropertyWatcher("x",{"xChanged":true},[param4[3]],null);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[5]);
         param5[2].addChild(param5[4]);
         param5[2].addChild(param5[3]);
      }
   }
}
