// import SimpleUploadAdapter from '@ckeditor/ckeditor5-upload/src/adapters/simpleuploadadapter';
import UploadAdapter from './UploadAdapter'

$(function(){

  $.getScript('https://renny-assets.oss-cn-chengdu.aliyuncs.com/files/ckeditor.js', function() {
      const editorEl = document.querySelector('#ckeditor-standard')

      if (editorEl) {
        ClassicEditor.create(editorEl, {
          // plugins: [ SimpleUploadAdapter, ],
          toolbar: {
            items: [
              'bold',
              'italic',
              'strikethrough',
              'underline',
              'fontColor',
              'fontBackgroundColor',
              'fontSize',
              'fontFamily',
              'link',
              '|',
              'bulletedList',
              'numberedList',
              'outdent',
              'indent',
              'alignment',
              'horizontalLine',
              '|',
              'insertTable',
              'mediaEmbed',
              'undo',
              'redo',
              '|',
              'sourceEditing',
              'removeFormat',
              'specialCharacters',
              '-',
              'heading',
              '|',
              'codeBlock',
              'code',
              'imageUpload',
              'imageInsert',
              'blockQuote'
            ],
            shouldNotGroupWhenFull: true
          },
          image: {
            toolbar: [
              'imageTextAlternative',
              'imageStyle:inline',
              'imageStyle:block',
              'imageStyle:side'
            ]
          },
          table: {
            contentToolbar: [
              'tableColumn',
              'tableRow',
              'mergeTableCells'
            ]
          },
        }).then(editor => {
          window.editor = editor;

          editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
            return new UploadAdapter(loader, {
              uploadUrl: async () => {
                const resp = await fetch('/uploads/new').then((res) => res.json())
                if (resp.err) message.error(resp.message)
                const { signed_url, url } = resp
                return {
                  method: 'PUT',
                  signed_url,
                  url,
                }
              },
              headers: {
                'Content-Type': 'image/jpeg',
              },
            })
          }
        }).catch(error => {
          console.log(error);
        });
      }  
  })

})
