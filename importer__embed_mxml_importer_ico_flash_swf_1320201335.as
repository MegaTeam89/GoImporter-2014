package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_importer_ico_flash_swf_1320201335 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_importer_ico_flash_swf_1320201335()
      {
         this.dataClass = importer__embed_mxml_importer_ico_flash_swf_1320201335_dataClass;
         super();
         initialWidth = 800 / 20;
         initialHeight = 800 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
