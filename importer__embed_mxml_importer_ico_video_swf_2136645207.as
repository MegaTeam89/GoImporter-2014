package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_importer_ico_video_swf_2136645207 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_importer_ico_video_swf_2136645207()
      {
         this.dataClass = importer__embed_mxml_importer_ico_video_swf_2136645207_dataClass;
         super();
         initialWidth = 960 / 20;
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
