package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_importer_ico_bg_swf_1668914773 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_importer_ico_bg_swf_1668914773()
      {
         this.dataClass = importer__embed_mxml_importer_ico_bg_swf_1668914773_dataClass;
         super();
         initialWidth = 900 / 20;
         initialHeight = 660 / 20;
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
