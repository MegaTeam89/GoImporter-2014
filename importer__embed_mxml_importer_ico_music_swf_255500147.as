package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_importer_ico_music_swf_255500147 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_importer_ico_music_swf_255500147()
      {
         this.dataClass = importer__embed_mxml_importer_ico_music_swf_255500147_dataClass;
         super();
         initialWidth = 740 / 20;
         initialHeight = 880 / 20;
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
