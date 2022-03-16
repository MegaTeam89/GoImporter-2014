package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_styles_ico_music_swf_2098773037 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_styles_ico_music_swf_2098773037()
      {
         this.dataClass = importer__embed_mxml_styles_ico_music_swf_2098773037_dataClass;
         super();
         initialWidth = 520 / 20;
         initialHeight = 520 / 20;
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
