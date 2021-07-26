import UploadAdapter from './UploadAdapter'

$(() => {
  $.getScript('https://renny-assets.oss-cn-chengdu.aliyuncs.com/files/ckeditor.js', () => {
      const editorEl = document.querySelector('#ckeditor-standard')
      const simpleEditorEl = document.querySelector('#ckeditor-simple')

      if (editorEl) {
        ClassicEditor.create(editorEl, {
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
              'imageInsert',
              'blockQuote',
              'htmlEmbed'
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
                const { url } = resp
                return {
                  method: 'PUT',
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

      if (simpleEditorEl) {
        ClassicEditor.create(simpleEditorEl, {
          toolbar: [ 'numberedList', 'bulletedList', '|', 'bold', 'italic', '|', 'link', 'undo', 'redo' ],
        }).then(editor => {
          window.editor = editor;
        }).catch(error => {
          console.log(error);
        });
      }
  })
})
