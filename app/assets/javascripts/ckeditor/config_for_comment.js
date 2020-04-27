if (typeof(CKEDITOR) !== 'undefined') {
  CKEDITOR.plugins.addExternal( 'emoji', '/assets/ckeditor/plugins/emoji/plugin.js' );
  CKEDITOR.plugins.addExternal( 'wordcount', '/assets/ckeditor/plugins/wordcount/plugin.js' );

  CKEDITOR.editorConfig = function( config ) {
    // config.uiColor = '#f0f8ff';
    config.extraPlugins = 'emoji, wordcount, autogrow';
    config.autoGrow_minHeight = 140;
    config.autoGrow_maxHeight = 500;
    config.emoji_emojiListUrl = '/assets/ckeditor/plugins/emoji/emoji.json';
    config.wordcount = {
      showParagraphs: true,
      showWordCount: true,
      showCharCount: true,
      maxCharCount: 40,
    }
    config.removePlugins = 'elementspath';
    config.resize_enabled = false;

    config.allowedContent = true;
    config.filebrowserUploadMethod = 'form';

    config.toolbar_for_comment = [
      { name: 'paragraph', groups: [ 'list' ], items: [ 'NumberedList', 'BulletedList' ] },
      { name: 'basicstyles', groups: [ 'basicstyles' ], items: [ 'Bold', 'Italic' ] },
      { name: 'insert', items: [ 'HorizontalRule' ] },
      { name: 'plugins', items: [ 'EmojiPanel' ] }
    ]
  };
}
